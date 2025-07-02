$PBExportHeader$w_programa_sala2.srw
forward
global type w_programa_sala2 from window
end type
type dp_1 from datepicker within w_programa_sala2
end type
type dw_agenda_prof from datawindow within w_programa_sala2
end type
type st_fecha_hora from statictext within w_programa_sala2
end type
type rb_des from radiobutton within w_programa_sala2
end type
type rb_asig from radiobutton within w_programa_sala2
end type
type dw_resumen from datawindow within w_programa_sala2
end type
type dw_det from datawindow within w_programa_sala2
end type
type pb_2 from picturebutton within w_programa_sala2
end type
type tab_1 from tab within w_programa_sala2
end type
type tp_1 from userobject within tab_1
end type
type st_20 from statictext within tp_1
end type
type st_19 from statictext within tp_1
end type
type st_17 from statictext within tp_1
end type
type st_15 from statictext within tp_1
end type
type st_14 from statictext within tp_1
end type
type st_18 from statictext within tp_1
end type
type st_16 from statictext within tp_1
end type
type st_13 from statictext within tp_1
end type
type st_12 from statictext within tp_1
end type
type st_11 from statictext within tp_1
end type
type st_2 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type st_4 from statictext within tp_1
end type
type st_3 from statictext within tp_1
end type
type dw_agenda from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
st_20 st_20
st_19 st_19
st_17 st_17
st_15 st_15
st_14 st_14
st_18 st_18
st_16 st_16
st_13 st_13
st_12 st_12
st_11 st_11
st_2 st_2
st_1 st_1
st_4 st_4
st_3 st_3
dw_agenda dw_agenda
end type
type tp_2 from userobject within tab_1
end type
type st_28 from statictext within tp_2
end type
type st_27 from statictext within tp_2
end type
type st_22 from statictext within tp_2
end type
type st_21 from statictext within tp_2
end type
type st_10 from statictext within tp_2
end type
type st_9 from statictext within tp_2
end type
type st_8 from statictext within tp_2
end type
type st_7 from statictext within tp_2
end type
type st_6 from statictext within tp_2
end type
type st_5 from statictext within tp_2
end type
type dw_resu_profe from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
st_28 st_28
st_27 st_27
st_22 st_22
st_21 st_21
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
dw_resu_profe dw_resu_profe
end type
type tab_1 from tab within w_programa_sala2
tp_1 tp_1
tp_2 tp_2
end type
type dw_tipo from datawindow within w_programa_sala2
end type
type dw_ano_mes1 from datawindow within w_programa_sala2
end type
type pb_1 from picturebutton within w_programa_sala2
end type
type dw_profes from datawindow within w_programa_sala2
end type
type gb_3 from groupbox within w_programa_sala2
end type
type gb_4 from groupbox within w_programa_sala2
end type
type dw_resu_prof from datawindow within w_programa_sala2
end type
type gb_6 from groupbox within w_programa_sala2
end type
type dw_sala from datawindow within w_programa_sala2
end type
type gb_2 from groupbox within w_programa_sala2
end type
type gb_1 from groupbox within w_programa_sala2
end type
end forward

global type w_programa_sala2 from window
integer width = 5339
integer height = 2132
boolean titlebar = true
string title = "Programación de Turnos"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_asig_cita.ico"
boolean center = true
dp_1 dp_1
dw_agenda_prof dw_agenda_prof
st_fecha_hora st_fecha_hora
rb_des rb_des
rb_asig rb_asig
dw_resumen dw_resumen
dw_det dw_det
pb_2 pb_2
tab_1 tab_1
dw_tipo dw_tipo
dw_ano_mes1 dw_ano_mes1
pb_1 pb_1
dw_profes dw_profes
gb_3 gb_3
gb_4 gb_4
dw_resu_prof dw_resu_prof
gb_6 gb_6
dw_sala dw_sala
gb_2 gb_2
gb_1 gb_1
end type
global w_programa_sala2 w_programa_sala2

type variables
datawindowchild idw_sala, idw_espe ,idw_cami,idw_auxiliarenf,idw_enfermero,idw_especialista
datawindowchild idw_auxiliarqx,idw_circulante,idw_instrumentador,idw_anestesiologo
datetime inicia , termina
boolean retirar,click
int fila,colu
string i_tipo, i_letra, i_ctrl, i_prof
long i_x, i_y

end variables
forward prototypes
public function dwobject lf_dwo (string p_column)
end prototypes

public function dwobject lf_dwo (string p_column);dwobject dwo
choose case p_column
	case 'espe0'
		dwo=tab_1.tp_1.dw_agenda.object.espe0
	case 'espe1'
		dwo=tab_1.tp_1.dw_agenda.object.espe1
	case 'espe2'
		dwo=tab_1.tp_1.dw_agenda.object.espe2
	case 'espe3'
		dwo=tab_1.tp_1.dw_agenda.object.espe3
	case 'espe4'
		dwo=tab_1.tp_1.dw_agenda.object.espe4
	case 'espe5'
		dwo=tab_1.tp_1.dw_agenda.object.espe5
	case 'espe6'
		dwo=tab_1.tp_1.dw_agenda.object.espe6
	case 'espe7'
		dwo=tab_1.tp_1.dw_agenda.object.espe7
	case 'espe8'
		dwo=tab_1.tp_1.dw_agenda.object.espe8
	case 'espe9'
		dwo=tab_1.tp_1.dw_agenda.object.espe9
	case 'espe10'
		dwo=tab_1.tp_1.dw_agenda.object.espe10
	case 'espe11'
		dwo=tab_1.tp_1.dw_agenda.object.espe11
	case 'espe12'
		dwo=tab_1.tp_1.dw_agenda.object.espe12
	case 'espe13'
		dwo=tab_1.tp_1.dw_agenda.object.espe13
	case 'espe14'
		dwo=tab_1.tp_1.dw_agenda.object.espe14
	case 'espe15'
		dwo=tab_1.tp_1.dw_agenda.object.espe15
	case 'espe16'
		dwo=tab_1.tp_1.dw_agenda.object.espe16
	case 'espe17'
		dwo=tab_1.tp_1.dw_agenda.object.espe17
	case 'espe18'
		dwo=tab_1.tp_1.dw_agenda.object.espe18
	case 'espe19'
		dwo=tab_1.tp_1.dw_agenda.object.espe19
	case 'espe20'
		dwo=tab_1.tp_1.dw_agenda.object.espe20
	case 'espe21'
		dwo=tab_1.tp_1.dw_agenda.object.espe21
	case 'espe22'
		dwo=tab_1.tp_1.dw_agenda.object.espe22
	case 'espe23'
		dwo=tab_1.tp_1.dw_agenda.object.espe23
	case 'ane0'
		dwo=tab_1.tp_1.dw_agenda.object.ane0
	case 'ane1'
		dwo=tab_1.tp_1.dw_agenda.object.ane1
	case 'ane2'
		dwo=tab_1.tp_1.dw_agenda.object.ane2
	case 'ane3'
		dwo=tab_1.tp_1.dw_agenda.object.ane3
	case 'ane4'
		dwo=tab_1.tp_1.dw_agenda.object.ane4
	case 'ane5'
		dwo=tab_1.tp_1.dw_agenda.object.ane5
	case 'ane6'
		dwo=tab_1.tp_1.dw_agenda.object.ane6
	case 'ane7'
		dwo=tab_1.tp_1.dw_agenda.object.ane7
	case 'ane8'
		dwo=tab_1.tp_1.dw_agenda.object.ane8
	case 'ane9'
		dwo=tab_1.tp_1.dw_agenda.object.ane9
	case 'ane10'
		dwo=tab_1.tp_1.dw_agenda.object.ane10
	case 'ane11'
		dwo=tab_1.tp_1.dw_agenda.object.ane11
	case 'ane12'
		dwo=tab_1.tp_1.dw_agenda.object.ane12
	case 'ane13'
		dwo=tab_1.tp_1.dw_agenda.object.ane13
	case 'ane14'
		dwo=tab_1.tp_1.dw_agenda.object.ane14
	case 'ane15'
		dwo=tab_1.tp_1.dw_agenda.object.ane15
	case 'ane16'
		dwo=tab_1.tp_1.dw_agenda.object.ane16
	case 'espe17'
		dwo=tab_1.tp_1.dw_agenda.object.ane17
	case 'ane18'
		dwo=tab_1.tp_1.dw_agenda.object.ane18
	case 'ane19'
		dwo=tab_1.tp_1.dw_agenda.object.ane19
	case 'ane20'
		dwo=tab_1.tp_1.dw_agenda.object.ane20
	case 'ane21'
		dwo=tab_1.tp_1.dw_agenda.object.ane21
	case 'ane22'
		dwo=tab_1.tp_1.dw_agenda.object.ane22
	case 'ane23'
		dwo=tab_1.tp_1.dw_agenda.object.ane23
	case 'inst0'
		dwo=tab_1.tp_1.dw_agenda.object.inst0
	case 'inst1'
		dwo=tab_1.tp_1.dw_agenda.object.inst1
	case 'inst2'
		dwo=tab_1.tp_1.dw_agenda.object.inst2
	case 'inst3'
		dwo=tab_1.tp_1.dw_agenda.object.inst3
	case 'inst4'
		dwo=tab_1.tp_1.dw_agenda.object.inst4
	case 'inst5'
		dwo=tab_1.tp_1.dw_agenda.object.inst5
	case 'inst6'
		dwo=tab_1.tp_1.dw_agenda.object.inst6
	case 'inst7'
		dwo=tab_1.tp_1.dw_agenda.object.inst7
	case 'inst8'
		dwo=tab_1.tp_1.dw_agenda.object.inst8
	case 'inst9'
		dwo=tab_1.tp_1.dw_agenda.object.inst9
	case 'inst10'
		dwo=tab_1.tp_1.dw_agenda.object.inst10
	case 'inst11'
		dwo=tab_1.tp_1.dw_agenda.object.inst11
	case 'inst12'
		dwo=tab_1.tp_1.dw_agenda.object.inst12
	case 'inst13'
		dwo=tab_1.tp_1.dw_agenda.object.inst13
	case 'inst14'
		dwo=tab_1.tp_1.dw_agenda.object.inst14
	case 'inst15'
		dwo=tab_1.tp_1.dw_agenda.object.inst15
	case 'inst16'
		dwo=tab_1.tp_1.dw_agenda.object.inst16
	case 'inst17'
		dwo=tab_1.tp_1.dw_agenda.object.inst17
	case 'inst18'
		dwo=tab_1.tp_1.dw_agenda.object.inst18
	case 'inst19'
		dwo=tab_1.tp_1.dw_agenda.object.inst19
	case 'inst20'
		dwo=tab_1.tp_1.dw_agenda.object.inst20
	case 'inst21'
		dwo=tab_1.tp_1.dw_agenda.object.inst21
	case 'inst22'
		dwo=tab_1.tp_1.dw_agenda.object.inst22
	case 'inst23'
		dwo=tab_1.tp_1.dw_agenda.object.inst23
	case 'cir0'
		dwo=tab_1.tp_1.dw_agenda.object.cir0
	case 'cir1'
		dwo=tab_1.tp_1.dw_agenda.object.cir1
	case 'cir2'
		dwo=tab_1.tp_1.dw_agenda.object.cir2
	case 'cir3'
		dwo=tab_1.tp_1.dw_agenda.object.cir3
	case 'cir4'
		dwo=tab_1.tp_1.dw_agenda.object.cir4
	case 'cir5'
		dwo=tab_1.tp_1.dw_agenda.object.cir5
	case 'cir6'
		dwo=tab_1.tp_1.dw_agenda.object.cir6
	case 'cir7'
		dwo=tab_1.tp_1.dw_agenda.object.cir7
	case 'cir8'
		dwo=tab_1.tp_1.dw_agenda.object.cir8
	case 'cir9'
		dwo=tab_1.tp_1.dw_agenda.object.cir9
	case 'cir10'
		dwo=tab_1.tp_1.dw_agenda.object.cir10
	case 'cir11'
		dwo=tab_1.tp_1.dw_agenda.object.cir11
	case 'cir12'
		dwo=tab_1.tp_1.dw_agenda.object.cir12
	case 'cir13'
		dwo=tab_1.tp_1.dw_agenda.object.cir13
	case 'cir14'
		dwo=tab_1.tp_1.dw_agenda.object.cir14
	case 'cir15'
		dwo=tab_1.tp_1.dw_agenda.object.cir15
	case 'cir16'
		dwo=tab_1.tp_1.dw_agenda.object.cir16
	case 'cir17'
		dwo=tab_1.tp_1.dw_agenda.object.cir17
	case 'cir18'
		dwo=tab_1.tp_1.dw_agenda.object.cir18
	case 'cir19'
		dwo=tab_1.tp_1.dw_agenda.object.cir19
	case 'cir20'
		dwo=tab_1.tp_1.dw_agenda.object.cir20
	case 'cir21'
			dwo=tab_1.tp_1.dw_agenda.object.cir21
	case 'cir22'
		dwo=tab_1.tp_1.dw_agenda.object.cir22
	case 'cir23'
		dwo=tab_1.tp_1.dw_agenda.object.cir23
	case 'aqx0'
		dwo=tab_1.tp_1.dw_agenda.object.aqx0
	case 'aqx1'
		dwo=tab_1.tp_1.dw_agenda.object.aqx1
	case 'aqx2'
		dwo=tab_1.tp_1.dw_agenda.object.aqx2
	case 'aqx3'
		dwo=tab_1.tp_1.dw_agenda.object.aqx3
	case 'aqx4'
		dwo=tab_1.tp_1.dw_agenda.object.aqx4
	case 'aqx5'
		dwo=tab_1.tp_1.dw_agenda.object.aqx5
	case 'aqx6'
		dwo=tab_1.tp_1.dw_agenda.object.aqx6
	case 'aqx7'
		dwo=tab_1.tp_1.dw_agenda.object.aqx7
	case 'aqx8'
		dwo=tab_1.tp_1.dw_agenda.object.aqx8
	case 'aqx9'
		dwo=tab_1.tp_1.dw_agenda.object.aqx9
	case 'aqx10'
		dwo=tab_1.tp_1.dw_agenda.object.aqx10
	case 'aqx11'
		dwo=tab_1.tp_1.dw_agenda.object.aqx11
	case 'aqx12'
		dwo=tab_1.tp_1.dw_agenda.object.aqx12
	case 'aqx13'
		dwo=tab_1.tp_1.dw_agenda.object.aqx13
	case 'aqx14'
		dwo=tab_1.tp_1.dw_agenda.object.aqx14
	case 'aqx15'
		dwo=tab_1.tp_1.dw_agenda.object.aqx15
	case 'aqx16'
		dwo=tab_1.tp_1.dw_agenda.object.aqx16
	case 'aqx17'
		dwo=tab_1.tp_1.dw_agenda.object.aqx17
	case 'aqx18'
		dwo=tab_1.tp_1.dw_agenda.object.aqx18
	case 'aqx19'
		dwo=tab_1.tp_1.dw_agenda.object.aqx19
	case 'aqx20'
		dwo=tab_1.tp_1.dw_agenda.object.aqx20
	case 'aqx21'
		dwo=tab_1.tp_1.dw_agenda.object.aqx21
	case 'aqx22'
		dwo=tab_1.tp_1.dw_agenda.object.aqx22
	case 'aqx23'
		dwo=tab_1.tp_1.dw_agenda.object.aqx23
	case 'enf0'
		dwo=tab_1.tp_1.dw_agenda.object.enf0
	case 'enf1'
		dwo=tab_1.tp_1.dw_agenda.object.enf1
	case 'enf2'
		dwo=tab_1.tp_1.dw_agenda.object.enf2
	case 'enf3'
		dwo=tab_1.tp_1.dw_agenda.object.enf3
	case 'enf4'
		dwo=tab_1.tp_1.dw_agenda.object.enf4
	case 'enf5'
		dwo=tab_1.tp_1.dw_agenda.object.enf5
	case 'enf6'
		dwo=tab_1.tp_1.dw_agenda.object.enf6
	case 'enf7'
		dwo=tab_1.tp_1.dw_agenda.object.enf7
	case 'enf8'
		dwo=tab_1.tp_1.dw_agenda.object.enf8
	case 'enf9'
		dwo=tab_1.tp_1.dw_agenda.object.enf9
	case 'enf10'
		dwo=tab_1.tp_1.dw_agenda.object.enf10
	case 'enf11'
		dwo=tab_1.tp_1.dw_agenda.object.enf11
	case 'enf12'
		dwo=tab_1.tp_1.dw_agenda.object.enf12
	case 'enf13'
		dwo=tab_1.tp_1.dw_agenda.object.enf13
	case 'enf14'
		dwo=tab_1.tp_1.dw_agenda.object.enf14
	case 'enf15'
		dwo=tab_1.tp_1.dw_agenda.object.enf15
	case 'enf16'
		dwo=tab_1.tp_1.dw_agenda.object.enf16
	case 'enf17'
		dwo=tab_1.tp_1.dw_agenda.object.enf17
	case 'enf18'
		dwo=tab_1.tp_1.dw_agenda.object.enf18
	case 'enf19'
		dwo=tab_1.tp_1.dw_agenda.object.enf19
	case 'enf20'
		dwo=tab_1.tp_1.dw_agenda.object.enf20
	case 'enf21'
		dwo=tab_1.tp_1.dw_agenda.object.enf21
	case 'enf22'
		dwo=tab_1.tp_1.dw_agenda.object.enf22
	case 'enf23'
		dwo=tab_1.tp_1.dw_agenda.object.enf23
	case 'xenf0'
		dwo=tab_1.tp_1.dw_agenda.object.xenf0
	case 'xenf1'
		dwo=tab_1.tp_1.dw_agenda.object.xenf1
	case 'xenf2'
		dwo=tab_1.tp_1.dw_agenda.object.xenf2
	case 'xenf3'
		dwo=tab_1.tp_1.dw_agenda.object.xenf3
	case 'xenf4'
		dwo=tab_1.tp_1.dw_agenda.object.xenf4
	case 'xenf5'
		dwo=tab_1.tp_1.dw_agenda.object.xenf5
	case 'xenf6'
		dwo=tab_1.tp_1.dw_agenda.object.xenf6
	case 'xenf7'
		dwo=tab_1.tp_1.dw_agenda.object.xenf7
	case 'xenf8'
		dwo=tab_1.tp_1.dw_agenda.object.xenf8
	case 'xenf9'
		dwo=tab_1.tp_1.dw_agenda.object.xenf9
	case 'xenf10'
		dwo=tab_1.tp_1.dw_agenda.object.xenf10
	case 'xenf11'
		dwo=tab_1.tp_1.dw_agenda.object.xenf11
	case 'xenf12'
		dwo=tab_1.tp_1.dw_agenda.object.xenf12
	case 'xenf13'
		dwo=tab_1.tp_1.dw_agenda.object.xenf13
	case 'xenf14'
		dwo=tab_1.tp_1.dw_agenda.object.xenf14
	case 'xenf15'
		dwo=tab_1.tp_1.dw_agenda.object.xenf15
	case 'xenf16'
		dwo=tab_1.tp_1.dw_agenda.object.xenf16
	case 'xenf17'
		dwo=tab_1.tp_1.dw_agenda.object.xenf17
	case 'xenf18'
		dwo=tab_1.tp_1.dw_agenda.object.xenf18
	case 'xenf19'
		dwo=tab_1.tp_1.dw_agenda.object.xenf19
	case 'xenf20'
		dwo=tab_1.tp_1.dw_agenda.object.xenf20
	case 'xenf21'
		dwo=tab_1.tp_1.dw_agenda.object.xenf21
	case 'xenf22'	
		dwo=tab_1.tp_1.dw_agenda.object.xenf22
	case 'xenf23'
		dwo=tab_1.tp_1.dw_agenda.object.xenf23
	case 'cam0'
		dwo=tab_1.tp_1.dw_agenda.object.cam0
	case 'cam1'
		dwo=tab_1.tp_1.dw_agenda.object.cam1
	case 'cam2'
		dwo=tab_1.tp_1.dw_agenda.object.cam2
	case 'cam3'
		dwo=tab_1.tp_1.dw_agenda.object.cam3
	case 'cam4'
		dwo=tab_1.tp_1.dw_agenda.object.cam4
	case 'cam5'
		dwo=tab_1.tp_1.dw_agenda.object.cam5
	case 'cam6'
		dwo=tab_1.tp_1.dw_agenda.object.cam6
	case 'cam7'
		dwo=tab_1.tp_1.dw_agenda.object.cam7
	case 'cam8'
		dwo=tab_1.tp_1.dw_agenda.object.cam8
	case 'cam9'
		dwo=tab_1.tp_1.dw_agenda.object.cam9
	case 'cam10'
		dwo=tab_1.tp_1.dw_agenda.object.cam10
	case 'cam11'
		dwo=tab_1.tp_1.dw_agenda.object.cam11
	case 'cam12'
		dwo=tab_1.tp_1.dw_agenda.object.cam12
	case 'cam13'
		dwo=tab_1.tp_1.dw_agenda.object.cam13
	case 'cam14'
		dwo=tab_1.tp_1.dw_agenda.object.cam14
	case 'cam15'
		dwo=tab_1.tp_1.dw_agenda.object.cam15
	case 'cam16'
		dwo=tab_1.tp_1.dw_agenda.object.cam16
	case 'cam17'
		dwo=tab_1.tp_1.dw_agenda.object.cam17
	case 'cam18'
		dwo=tab_1.tp_1.dw_agenda.object.cam18
	case 'cam19'
		dwo=tab_1.tp_1.dw_agenda.object.cam19
	case 'cam20'
		dwo=tab_1.tp_1.dw_agenda.object.cam20
	case 'cam21'
		dwo=tab_1.tp_1.dw_agenda.object.cam21
	case 'cam22'
		dwo=tab_1.tp_1.dw_agenda.object.cam22
	case 'cam23'
		dwo=tab_1.tp_1.dw_agenda.object.cam23
	case else
		setnull(dwo)
end choose
return dwo
end function

on w_programa_sala2.create
this.dp_1=create dp_1
this.dw_agenda_prof=create dw_agenda_prof
this.st_fecha_hora=create st_fecha_hora
this.rb_des=create rb_des
this.rb_asig=create rb_asig
this.dw_resumen=create dw_resumen
this.dw_det=create dw_det
this.pb_2=create pb_2
this.tab_1=create tab_1
this.dw_tipo=create dw_tipo
this.dw_ano_mes1=create dw_ano_mes1
this.pb_1=create pb_1
this.dw_profes=create dw_profes
this.gb_3=create gb_3
this.gb_4=create gb_4
this.dw_resu_prof=create dw_resu_prof
this.gb_6=create gb_6
this.dw_sala=create dw_sala
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dp_1,&
this.dw_agenda_prof,&
this.st_fecha_hora,&
this.rb_des,&
this.rb_asig,&
this.dw_resumen,&
this.dw_det,&
this.pb_2,&
this.tab_1,&
this.dw_tipo,&
this.dw_ano_mes1,&
this.pb_1,&
this.dw_profes,&
this.gb_3,&
this.gb_4,&
this.dw_resu_prof,&
this.gb_6,&
this.dw_sala,&
this.gb_2,&
this.gb_1}
end on

on w_programa_sala2.destroy
destroy(this.dp_1)
destroy(this.dw_agenda_prof)
destroy(this.st_fecha_hora)
destroy(this.rb_des)
destroy(this.rb_asig)
destroy(this.dw_resumen)
destroy(this.dw_det)
destroy(this.pb_2)
destroy(this.tab_1)
destroy(this.dw_tipo)
destroy(this.dw_ano_mes1)
destroy(this.pb_1)
destroy(this.dw_profes)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.dw_resu_prof)
destroy(this.gb_6)
destroy(this.dw_sala)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;dw_tipo.setfocus()
if g_motor='postgres' then
	dw_det.dataobject='dw_agenda_qx_postgres'
	dw_resumen.dataobject='dw_resumen_qx_postgres'
    dw_resu_prof.dataobject='dw_sp_prog_prof_postgres'
	tab_1.tp_2.dw_resu_profe.dataobject='dw_horas_profe_postgres'	 
end if
if g_motor='anywhere' then
	dw_det.dataobject='dw_agenda_qx'
	dw_resumen.dataobject='dw_resumen_qx'
	dw_resu_prof.dataobject='dw_sp_prog_prof'
	tab_1.tp_2.dw_resu_profe.dataobject='dw_horas_profe'
end if
if g_motor='sql' then
	dw_det.dataobject='dw_agenda_qx'
	dw_resumen.dataobject='dw_resumen_qx'
	dw_resu_prof.dataobject='dw_sp_prog_prof'
	tab_1.tp_2.dw_resu_profe.dataobject='dw_horas_profe_sql'
end if
dw_det.settransobject(sqlca)
dw_resumen.settransobject(sqlca)
dw_resu_prof.settransobject(sqlca)
tab_1.tp_2.dw_resu_profe.settransobject(sqlca)
end event

type dp_1 from datepicker within w_programa_sala2
integer x = 69
integer y = 76
integer width = 741
integer height = 84
integer taborder = 100
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-07-02"), Time("09:04:25.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;datetime ld_fecha
ld_fecha=dtm
inicia=datetime(relativedate(date(ld_fecha),1 - daynumber(date(ld_fecha))))
termina=datetime(relativedate(date(ld_fecha),7 - daynumber(date(ld_fecha))))
dw_sala.triggerevent(itemchanged!)
dw_profes.setcolumn('especialista')
dw_profes.triggerevent(itemchanged!)
end event

event constructor;datetime ld_fecha
ld_fecha=datetime(today())
inicia=datetime(relativedate(date(ld_fecha),1 - daynumber(date(ld_fecha))))
termina=datetime(relativedate(date(ld_fecha),7 - daynumber(date(ld_fecha))))
end event

type dw_agenda_prof from datawindow within w_programa_sala2
boolean visible = false
integer x = 3360
integer width = 311
integer height = 100
integer taborder = 100
boolean enabled = false
string title = "none"
string dataobject = "dw_agenda_prof_x_qx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type st_fecha_hora from statictext within w_programa_sala2
integer x = 18
integer y = 1196
integer width = 1723
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type rb_des from radiobutton within w_programa_sala2
integer x = 530
integer y = 1020
integer width = 261
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Retirar"
end type

event clicked;if not retirar then
	retirar=true
	tab_1.tp_1.dw_agenda.event deselec()
end if
end event

type rb_asig from radiobutton within w_programa_sala2
integer x = 178
integer y = 1020
integer width = 274
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asignar"
boolean checked = true
end type

event clicked;if retirar then
	retirar=false
	tab_1.tp_1.dw_agenda.event deselec()
end if
end event

type dw_resumen from datawindow within w_programa_sala2
string tag = "trae los datos para pintar la programacion de sala"
boolean visible = false
integer x = 3762
integer y = 12
integer width = 151
integer height = 72
boolean enabled = false
string title = "none"
string dataobject = "dw_resumen_qx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.settransobject(sqlca)
end event

event retrieveend;long j,fil,hora
string tipo
for j=1 to rowcount
	fil=this.getitemnumber(j,'dia')
	hora=hour(time(this.getitemdatetime(j,'hora')))
	tipo = this.getitemstring(j,'anestesia')
	if tipo = '0' then //especialistas
		tab_1.tp_1.dw_agenda.setitem(fil,'espe'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '1' then
		tab_1.tp_1.dw_agenda.setitem(fil,'ane'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '2' then
		tab_1.tp_1.dw_agenda.setitem(fil,'inst'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '3' then
		tab_1.tp_1.dw_agenda.setitem(fil,'cir'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '4' then
		tab_1.tp_1.dw_agenda.setitem(fil,'aqx'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '5' then
		tab_1.tp_1.dw_agenda.setitem(fil,'enf'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '6' then
		tab_1.tp_1.dw_agenda.setitem(fil,'xenf'+string(hora),this.getitemnumber(j,'cuantos'))
	elseif tipo = '7' then
		tab_1.tp_1.dw_agenda.setitem(fil,'cam'+string(hora),this.getitemnumber(j,'cuantos'))
	end if
next

end event

type dw_det from datawindow within w_programa_sala2
integer x = 18
integer y = 1272
integer width = 1733
integer height = 624
integer taborder = 60
string title = "none"
string dataobject = "dw_agenda_qx"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.settransobject(sqlca)
end event

event sqlpreview;string i
i= ''
end event

type pb_2 from picturebutton within w_programa_sala2
integer x = 1248
integer y = 40
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &r"
boolean originalsize = true
string picturename = "refrescar.gif"
alignment htextalign = left!
string powertiptext = "Refrescar [Alt+R]"
end type

event clicked;string esp
esp=dw_profes.getitemstring(1,'cesp')
dw_sala.triggerevent(itemchanged!)
if esp<>'' and not isnull(esp) then 
	dw_profes.setitem(1,'cesp',esp)
	dw_profes.setcolumn('cesp')
	dw_profes.triggerevent(itemchanged!)
end if
sqlca.autocommit=true
if dw_profes.getitemstring(1,'tipo')='1' then
	tab_1.tp_2.dw_resu_profe.retrieve(dw_profes.getitemstring(1,'anestesiologo'),inicia,termina)
else
	tab_1.tp_2.dw_resu_profe.retrieve(dw_profes.getitemstring(1,'especialista'),inicia,termina)
end if
sqlca.autocommit=false
end event

type tab_1 from tab within w_programa_sala2
integer x = 1815
integer width = 3451
integer height = 1928
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3415
integer height = 1800
long backcolor = 67108864
string text = "Programación de Turnos"
long tabtextcolor = 33554432
string picturename = "apptl.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra el resumen de Profesionales asignados al Area en el mes"
st_20 st_20
st_19 st_19
st_17 st_17
st_15 st_15
st_14 st_14
st_18 st_18
st_16 st_16
st_13 st_13
st_12 st_12
st_11 st_11
st_2 st_2
st_1 st_1
st_4 st_4
st_3 st_3
dw_agenda dw_agenda
end type

on tp_1.create
this.st_20=create st_20
this.st_19=create st_19
this.st_17=create st_17
this.st_15=create st_15
this.st_14=create st_14
this.st_18=create st_18
this.st_16=create st_16
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_2=create st_2
this.st_1=create st_1
this.st_4=create st_4
this.st_3=create st_3
this.dw_agenda=create dw_agenda
this.Control[]={this.st_20,&
this.st_19,&
this.st_17,&
this.st_15,&
this.st_14,&
this.st_18,&
this.st_16,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_2,&
this.st_1,&
this.st_4,&
this.st_3,&
this.dw_agenda}
end on

on tp_1.destroy
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_17)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_18)
destroy(this.st_16)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_agenda)
end on

type st_20 from statictext within tp_1
integer x = 389
integer y = 1740
integer width = 489
integer height = 52
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "<-----Anestesiologos----->"
boolean focusrectangle = false
end type

type st_19 from statictext within tp_1
integer x = 389
integer y = 1692
integer width = 485
integer height = 52
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "<-------Especialistas------>"
boolean focusrectangle = false
end type

type st_17 from statictext within tp_1
integer x = 2313
integer y = 1744
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(192,192,192)
end event

type st_15 from statictext within tp_1
integer x = 1957
integer y = 1688
integer width = 357
integer height = 92
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "En otra Sala/Cons. o diferente espec."
boolean focusrectangle = false
end type

type st_14 from statictext within tp_1
integer x = 2313
integer y = 1692
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(192,192,192)
end event

type st_18 from statictext within tp_1
integer x = 1833
integer y = 1744
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb( 122 , 154 , 122 )
end event

type st_16 from statictext within tp_1
integer x = 1152
integer y = 1740
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb ( 160 , 192 , 160 )

end event

type st_13 from statictext within tp_1
integer x = 1339
integer y = 1692
integer width = 494
integer height = 96
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Con cirugias programadas en esta sala"
boolean focusrectangle = false
end type

type st_12 from statictext within tp_1
integer x = 914
integer y = 1696
integer width = 233
integer height = 84
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Programado en esta Sala"
boolean focusrectangle = false
end type

type st_11 from statictext within tp_1
integer x = 1833
integer y = 1692
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb( 175 , 133 , 133 )
end event

type st_2 from statictext within tp_1
integer x = 1152
integer y = 1688
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb ( 220 , 175 , 175 )

end event

type st_1 from statictext within tp_1
integer x = 23
integer y = 1688
integer width = 210
integer height = 92
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disponibles en la Sala"
boolean focusrectangle = false
end type

type st_4 from statictext within tp_1
integer x = 261
integer y = 1744
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
boolean border = true
long bordercolor = 10789024
boolean focusrectangle = false
end type

type st_3 from statictext within tp_1
integer x = 261
integer y = 1692
integer width = 59
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
long bordercolor = 10789024
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(220,200,200)
end event

type dw_agenda from datawindow within tp_1
event desocupa ( )
event deselec ( )
event clickup pbm_dwnlbuttonup
event check ( long row,  dwobject dwo,  boolean repintar )
event type dwobject sel_dwo ( long k )
event insert_new ( long j,  long k,  integer emp_n,  integer emp_v,  string prof,  string espe )
event cambia_viejo ( long j,  long k,  integer emp_n,  integer emp_v )
event chequea ( integer row,  integer col,  boolean repintar )
event mousemove pbm_dwnmousemove
integer x = 18
integer width = 3397
integer height = 1664
integer taborder = 50
string title = "none"
string dataobject = "dw_mes_qx2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event desocupa();long j,k
setpointer(HourGlass!)
for j=0 to 23
	k=find('sel'+string(j)+'<>"0" or esta'+string(j)+'<>"0" or ocup'+string(j)+'<>"0"',1,rowcount())
	do while k>0
		setitem(k,'sel'+string(j),'0')
		setitem(k,'esta'+string(j),'0')
		setitem(k,'ocup'+string(j),'0')
		k=find('sel'+string(j)+'<>"0" or esta'+string(j)+'<>"0" or ocup'+string(j)+'<>"0"',1,rowcount())
	loop 
next
accepttext()
setredraw(true)
setpointer(Arrow!)
end event

event deselec();long j,k
setpointer(HourGlass!)
for j=0 to 23
	k=find('sel'+string(j)+'<>"0"',1,rowcount())
	do while k>0
		setitem(k,'sel'+string(j),'0')
		k=find('sel'+string(j)+'<>"0"',1,rowcount())
	loop 
next
accepttext()
setredraw(true)
setpointer(Arrow!)
end event

event clickup;click=false
gb_2.visible=false
gb_6.visible=false
if isnull(left(dwo.name,3)) then return
if row<1 or dwo.type='datawindow' or (left(dwo.name,3)<>'esp' and left(dwo.name,3)<>'ane' and left(dwo.name,3)<>'ins' and left(dwo.name,3)<>'cir' and left(dwo.name,3)<>'aqx' and left(dwo.name,3)<>'enf' and left(dwo.name,3)<>'xen' and left(dwo.name,3)<>'cam') then return
string cual,estoy
dwobject este
if isnumber(right(dwo.name,2)) then
	cual=right(dwo.name,2)
elseif isnumber(right(dwo.name,1)) then
	cual=right(dwo.name,1)
end if
//mle_1.Text = mle_1.Text + 'clickup '+string(row)+'-'+cual +"~r~n"
if fila=row and colu=long(cual) then
	//event check(row,dwo,true)
	event chequea(row,long(cual),true)
else
	long j,k
	long ini_fil,ini_col,fin_fil,fin_col
	if row<fila then 
		ini_fil=row
		fin_fil=fila
	else
		ini_fil=fila
		fin_fil=row
	end if
	if long(cual)<colu then
		ini_col=long(cual)
		fin_col=colu
	else
		ini_col=colu
		fin_col=long(cual)
	end if
	for j= ini_fil to fin_fil
		for k=ini_col to fin_col
			este=event sel_dwo(k)
			//event check(j,este,false)
			event chequea(j,k,false)
		next
	next
//	if isnumber(right(getcolumnname(),2)) then
//		estoy = right(getcolumnname(),2)
//	elseif isnumber(right(getcolumnname(),1)) then
//		estoy = right(getcolumnname(),1)
//	end if
//	este=event sel_dwo(long(estoy))
//	event check(getrow(),este,false)
end if
setredraw(true)

end event

event check(long row, dwobject dwo, boolean repintar);if row<1 or dwo.type='datawindow' or (left(dwo.name,3)<>'esp' and left(dwo.name,3)<>'ane') then return
if i_tipo ='0' then //especialistas
	if dw_profes.getitemstring(1,'especialista')='' or isnull(dw_profes.getitemstring(1,'especialista')) then return
elseif i_tipo = '1' then
	if dw_profes.getitemstring(1,'anestesiologo')='' or isnull(dw_profes.getitemstring(1,'anestesiologo')) then return
elseif i_tipo = '2' then
	if dw_profes.getitemstring(1,'instrumentador')='' or isnull(dw_profes.getitemstring(1,'instrumentador')) then return
elseif i_tipo = '3' then
	if dw_profes.getitemstring(1,'circulante')='' or isnull(dw_profes.getitemstring(1,'circulante')) then return
elseif i_tipo = '4' then
	if dw_profes.getitemstring(1,'auxiliarqx')='' or isnull(dw_profes.getitemstring(1,'auxiliarqx')) then return
elseif i_tipo = '5' then
	if dw_profes.getitemstring(1,'enfermero')='' or isnull(dw_profes.getitemstring(1,'enfermero')) then return
elseif i_tipo = '6' then
	if dw_profes.getitemstring(1,'auxiliarenf')='' or isnull(dw_profes.getitemstring(1,'auxiliarenf')) then return
elseif i_tipo = '7' then
	if dw_profes.getitemstring(1,'camillero')='' or isnull(dw_profes.getitemstring(1,'camillero')) then return
end if
if (isnull(dw_profes.getitemstring(1,'cesp')) or dw_profes.getitemstring(1,'cesp')='') then
	if repintar then messagebox("Atención",'Debe escoger la especialidad del profesional')
	return
end if
string cual
long k
if isnumber(right(dwo.name,2)) then
	cual=right(dwo.name,2)
elseif isnumber(right(dwo.name,1)) then
	cual=right(dwo.name,1)
end if
if rb_asig.checked then //ocupar
	if getitemstring(row,'ocup'+cual)<>'0' or getitemstring(row,'esta'+cual)<>'0' then return
	if getitemstring(row,'sel'+cual)= i_letra and i_letra = i_ctrl then
		setitem(row,'sel'+cual,'0')
	elseif i_letra = i_ctrl then
		setitem(row,'sel'+cual,i_letra)
	end if
else //desocupar
	if getitemstring(row,'ocup'+cual)=i_letra or getitemstring(row,'esta'+cual)<> i_letra then return
	if getitemstring(row,'sel'+cual) = i_letra and i_letra = i_ctrl then
		setitem(row,'sel'+cual,'0')
	else
		k=long(cual) +1
		do while k<=23
			if getitemstring(row,'ocup'+string(k)) = i_letra and getitemstring(row,'esta'+string(k))=i_letra and getitemnumber(row,'emp'+string(k))=getitemnumber(row,'emp'+cual) then 
				if repintar then messagebox("Atención",'Este intervalo ya no se puede cambiar porque tiene Programación más adelante')
				return
			end if
			if getitemnumber(row,'emp'+string(k))<>getitemnumber(row,'emp'+cual) then exit
			k ++
		loop
		setitem(row,'sel'+cual,i_letra)
	end if
end if
if repintar then setredraw(repintar)

end event

event type dwobject sel_dwo(long k);string tipo
dwobject este
tipo=dw_profes.getitemstring(1,'tipo')
choose case k
	case 0
		if i_tipo='0' then
			este=this.object.espe0
		elseif i_tipo ='1' then
			este=this.object.ane0
		elseif i_tipo ='2' then
			este=this.object.inst0
		elseif i_tipo ='3' then
			este=this.object.cir0
		elseif i_tipo ='4' then
			este=this.object.aqx0
		elseif i_tipo ='5' then
			este=this.object.enf0
		elseif i_tipo ='6' then
			este=this.object.xenf0
		elseif i_tipo ='7' then
			este=this.object.cam0
		end if
	case 1
		if i_tipo='0' then
			este=this.object.espe1
		elseif i_tipo ='1' then
			este=this.object.ane1
		elseif i_tipo ='2' then
			este=this.object.inst1
		elseif i_tipo ='3' then
			este=this.object.cir1
		elseif i_tipo ='4' then
			este=this.object.aqx1
		elseif i_tipo ='5' then
			este=this.object.enf1
		elseif i_tipo ='6' then
			este=this.object.xenf1
		elseif i_tipo ='7' then
			este=this.object.cam1
		end if
	case 2
		if i_tipo='0' then
			este=this.object.espe2
		elseif i_tipo ='1' then
			este=this.object.ane2
		elseif i_tipo ='2' then
			este=this.object.inst2
		elseif i_tipo ='3' then
			este=this.object.cir2
		elseif i_tipo ='4' then
			este=this.object.aqx2
		elseif i_tipo ='5' then
			este=this.object.enf2
		elseif i_tipo ='6' then
			este=this.object.xenf2
		elseif i_tipo ='7' then
			este=this.object.cam2
		end if
	case 3
		if i_tipo='0' then
			este=this.object.espe3
		elseif i_tipo ='1' then
			este=this.object.ane3
		elseif i_tipo ='2' then
			este=this.object.inst3
		elseif i_tipo ='3' then
			este=this.object.cir3
		elseif i_tipo ='4' then
			este=this.object.aqx3
		elseif i_tipo ='5' then
			este=this.object.enf3
		elseif i_tipo ='6' then
			este=this.object.xenf3
		elseif i_tipo ='7' then
			este=this.object.cam3
		end if
	case 4
		if i_tipo='0' then
			este=this.object.espe4
		elseif i_tipo ='1' then
			este=this.object.ane4
		elseif i_tipo ='2' then
			este=this.object.inst4
		elseif i_tipo ='3' then
			este=this.object.cir4
		elseif i_tipo ='4' then
			este=this.object.aqx4
		elseif i_tipo ='5' then
			este=this.object.enf4
		elseif i_tipo ='6' then
			este=this.object.xenf4
		elseif i_tipo ='7' then
			este=this.object.cam4
		end if
	case 5
		if i_tipo='0' then
			este=this.object.espe5
		elseif i_tipo ='1' then
			este=this.object.ane5
		elseif i_tipo ='2' then
			este=this.object.inst5
		elseif i_tipo ='3' then
			este=this.object.cir5
		elseif i_tipo ='4' then
			este=this.object.aqx5
		elseif i_tipo ='5' then
			este=this.object.enf5
		elseif i_tipo ='6' then
			este=this.object.xenf5
		elseif i_tipo ='7' then
			este=this.object.cam5
		end if
	case 6
		if i_tipo='0' then
			este=this.object.espe6
		elseif i_tipo ='1' then
			este=this.object.ane6
		elseif i_tipo ='2' then
			este=this.object.inst6
		elseif i_tipo ='3' then
			este=this.object.cir6
		elseif i_tipo ='4' then
			este=this.object.aqx6
		elseif i_tipo ='5' then
			este=this.object.enf6
		elseif i_tipo ='6' then
			este=this.object.xenf6
		elseif i_tipo ='7' then
			este=this.object.cam6
		end if
	case 7
		if i_tipo='0' then
			este=this.object.espe7
		elseif i_tipo ='1' then
			este=this.object.ane7
		elseif i_tipo ='2' then
			este=this.object.inst7
		elseif i_tipo ='3' then
			este=this.object.cir7
		elseif i_tipo ='4' then
			este=this.object.aqx7
		elseif i_tipo ='5' then
			este=this.object.enf7
		elseif i_tipo ='6' then
			este=this.object.xenf7
		elseif i_tipo ='7' then
			este=this.object.cam7
		end if
	case 8
		if i_tipo='0' then
			este=this.object.espe8
		elseif i_tipo ='1' then
			este=this.object.ane8
		elseif i_tipo ='2' then
			este=this.object.inst8
		elseif i_tipo ='3' then
			este=this.object.cir8
		elseif i_tipo ='4' then
			este=this.object.aqx8
		elseif i_tipo ='5' then
			este=this.object.enf8
		elseif i_tipo ='6' then
			este=this.object.xenf8
		elseif i_tipo ='7' then
			este=this.object.cam8
		end if
	case 9
		if i_tipo='0' then
			este=this.object.espe9
		elseif i_tipo ='1' then
			este=this.object.ane9
		elseif i_tipo ='2' then
			este=this.object.inst9
		elseif i_tipo ='3' then
			este=this.object.cir9
		elseif i_tipo ='4' then
			este=this.object.aqx9
		elseif i_tipo ='5' then
			este=this.object.enf9
		elseif i_tipo ='6' then
			este=this.object.xenf9
		elseif i_tipo ='7' then
			este=this.object.cam9
		end if
	case 10
		if i_tipo='0' then
			este=this.object.espe10
		elseif i_tipo ='1' then
			este=this.object.ane10
		elseif i_tipo ='2' then
			este=this.object.inst10
		elseif i_tipo ='3' then
			este=this.object.cir10
		elseif i_tipo ='4' then
			este=this.object.aqx10
		elseif i_tipo ='5' then
			este=this.object.enf10
		elseif i_tipo ='6' then
			este=this.object.xenf10
		elseif i_tipo ='7' then
			este=this.object.cam10
		end if
	case 11
		if i_tipo='0' then
			este=this.object.espe11
		elseif i_tipo ='1' then
			este=this.object.ane11
		elseif i_tipo ='2' then
			este=this.object.inst11
		elseif i_tipo ='3' then
			este=this.object.cir11
		elseif i_tipo ='4' then
			este=this.object.aqx11
		elseif i_tipo ='5' then
			este=this.object.enf11
		elseif i_tipo ='6' then
			este=this.object.xenf11
		elseif i_tipo ='7' then
			este=this.object.cam11
		end if
	case 12
		if i_tipo='0' then
			este=this.object.espe12
		elseif i_tipo ='1' then
			este=this.object.ane12
		elseif i_tipo ='2' then
			este=this.object.inst12
		elseif i_tipo ='3' then
			este=this.object.cir12
		elseif i_tipo ='4' then
			este=this.object.aqx12
		elseif i_tipo ='5' then
			este=this.object.enf12
		elseif i_tipo ='6' then
			este=this.object.xenf12
		elseif i_tipo ='7' then
			este=this.object.cam12
		end if
	case 13
		if i_tipo='0' then
			este=this.object.espe13
		elseif i_tipo ='1' then
			este=this.object.ane13
		elseif i_tipo ='2' then
			este=this.object.inst13
		elseif i_tipo ='3' then
			este=this.object.cir13
		elseif i_tipo ='4' then
			este=this.object.aqx13
		elseif i_tipo ='5' then
			este=this.object.enf13
		elseif i_tipo ='6' then
			este=this.object.xenf13
		elseif i_tipo ='7' then
			este=this.object.cam13
		end if
	case 14
		if i_tipo='0' then
			este=this.object.espe14
		elseif i_tipo ='1' then
			este=this.object.ane14
		elseif i_tipo ='2' then
			este=this.object.inst14
		elseif i_tipo ='3' then
			este=this.object.cir14
		elseif i_tipo ='4' then
			este=this.object.aqx14
		elseif i_tipo ='5' then
			este=this.object.enf14
		elseif i_tipo ='6' then
			este=this.object.xenf14
		elseif i_tipo ='7' then
			este=this.object.cam14
		end if
	case 15
		if i_tipo='0' then
			este=this.object.espe15
		elseif i_tipo ='1' then
			este=this.object.ane15
		elseif i_tipo ='2' then
			este=this.object.inst15
		elseif i_tipo ='3' then
			este=this.object.cir15
		elseif i_tipo ='4' then
			este=this.object.aqx15
		elseif i_tipo ='5' then
			este=this.object.enf15
		elseif i_tipo ='6' then
			este=this.object.xenf15
		elseif i_tipo ='7' then
			este=this.object.cam15
		end if
	case 16
		if i_tipo='0' then
			este=this.object.espe16
		elseif i_tipo ='1' then
			este=this.object.ane16
		elseif i_tipo ='2' then
			este=this.object.inst16
		elseif i_tipo ='3' then
			este=this.object.cir16
		elseif i_tipo ='4' then
			este=this.object.aqx16
		elseif i_tipo ='5' then
			este=this.object.enf16
		elseif i_tipo ='6' then
			este=this.object.xenf16
		elseif i_tipo ='7' then
			este=this.object.cam16
		end if
	case 17
		if i_tipo='0' then
			este=this.object.espe17
		elseif i_tipo ='1' then
			este=this.object.ane17
		elseif i_tipo ='2' then
			este=this.object.inst17
		elseif i_tipo ='3' then
			este=this.object.cir17
		elseif i_tipo ='4' then
			este=this.object.aqx17
		elseif i_tipo ='5' then
			este=this.object.enf17
		elseif i_tipo ='6' then
			este=this.object.xenf17
		elseif i_tipo ='7' then
			este=this.object.cam17
		end if
	case 18
		if i_tipo='0' then
			este=this.object.espe18
		elseif i_tipo ='1' then
			este=this.object.ane18
		elseif i_tipo ='2' then
			este=this.object.inst18
		elseif i_tipo ='3' then
			este=this.object.cir18
		elseif i_tipo ='4' then
			este=this.object.aqx18
		elseif i_tipo ='5' then
			este=this.object.enf18
		elseif i_tipo ='6' then
			este=this.object.xenf18
		elseif i_tipo ='7' then
			este=this.object.cam18
		end if
	case 19
		if i_tipo='0' then
			este=this.object.espe19
		elseif i_tipo ='1' then
			este=this.object.ane19
		elseif i_tipo ='2' then
			este=this.object.inst19
		elseif i_tipo ='3' then
			este=this.object.cir19
		elseif i_tipo ='4' then
			este=this.object.aqx19
		elseif i_tipo ='5' then
			este=this.object.enf19
		elseif i_tipo ='6' then
			este=this.object.xenf19
		elseif i_tipo ='7' then
			este=this.object.cam19
		end if
	case 20
		if i_tipo='0' then
			este=this.object.espe20
		elseif i_tipo ='1' then
			este=this.object.ane20
		elseif i_tipo ='2' then
			este=this.object.inst20
		elseif i_tipo ='3' then
			este=this.object.cir20
		elseif i_tipo ='4' then
			este=this.object.aqx20
		elseif i_tipo ='5' then
			este=this.object.enf20
		elseif i_tipo ='6' then
			este=this.object.xenf20
		elseif i_tipo ='7' then
			este=this.object.cam20
		end if
	case 21
		if i_tipo='0' then
			este=this.object.espe21
		elseif i_tipo ='1' then
			este=this.object.ane21
		elseif i_tipo ='2' then
			este=this.object.inst21
		elseif i_tipo ='3' then
			este=this.object.cir21
		elseif i_tipo ='4' then
			este=this.object.aqx21
		elseif i_tipo ='5' then
			este=this.object.enf21
		elseif i_tipo ='6' then
			este=this.object.xenf21
		elseif i_tipo ='7' then
			este=this.object.cam21
		end if
	case 22
		if i_tipo='0' then
			este=this.object.espe22
		elseif i_tipo ='1' then
			este=this.object.ane22
		elseif i_tipo ='2' then
			este=this.object.inst22
		elseif i_tipo ='3' then
			este=this.object.cir22
		elseif i_tipo ='4' then
			este=this.object.aqx22
		elseif i_tipo ='5' then
			este=this.object.enf22
		elseif i_tipo ='6' then
			este=this.object.xenf22
		elseif i_tipo ='7' then
			este=this.object.cam22
		end if
	case 23
		if i_tipo='0' then
			este=this.object.espe23
		elseif i_tipo ='1' then
			este=this.object.ane23
		elseif i_tipo ='2' then
			este=this.object.inst23
		elseif i_tipo ='3' then
			este=this.object.cir23
		elseif i_tipo ='4' then
			este=this.object.aqx23
		elseif i_tipo ='5' then
			este=this.object.enf23
		elseif i_tipo ='6' then
			este=this.object.xenf23
		elseif i_tipo ='7' then
			este=this.object.cam23
		end if
end choose
return este
end event

event insert_new(long j, long k, integer emp_n, integer emp_v, string prof, string espe);long donde
donde=dw_agenda_prof.insertrow(0)
dw_agenda_prof.setitem(donde,'hora',datetime(date('1900-01-01'),time(emp_n,0,0)))
dw_agenda_prof.setitem(donde,'codgc',dw_tipo.getitemstring(1,1))
dw_agenda_prof.setitem(donde,'consult',dw_sala.getitemstring(1,1))
dw_agenda_prof.setitem(donde,'cesp',espe)
dw_agenda_prof.setitem(donde,'prof',prof)
dw_agenda_prof.setitem(donde,'fecha',getitemdatetime(j,'fecha'))
dw_agenda_prof.setitem(donde,'duracion',(k -emp_n)*60)
dw_agenda_prof.setitem(donde,'usuario',usuario)
dw_agenda_prof.setitem(donde,'fecha_crea',datetime(today(),now()))

end event

event cambia_viejo(long j, long k, integer emp_n, integer emp_v);long donde
donde=dw_agenda_prof.find('date(fecha)=date("'+string(getitemdatetime(j,'fecha'),'yyyy-mm-dd')+'") and time(hora)=time("'+string(emp_v)+'")',1,dw_agenda_prof.rowcount())
if donde=0 then
	//es posible que sea uno nuevo cuando desocupó
	donde=dw_agenda_prof.find('date(fecha)=date("'+string(getitemdatetime(j,'fecha'),'yyyy-mm-dd')+'") and time(hora)=time("'+string(getitemnumber(j,'emp'+string(emp_v)))+'") and duracion>='+string((k -getitemnumber(j,'emp'+string(emp_v)) -1 )*60),1,dw_agenda_prof.rowcount())
	if donde=0 then
		string prof
		if dw_profes.getitemstring(1,'tipo')='0' then
			prof=dw_profes.getitemstring(1,'especialista')
		else
			prof=dw_profes.getitemstring(1,'anestesiologo')
		end if
		event insert_new(j,k,emp_v,emp_v,prof,dw_profes.getitemstring(1,'cesp'))
		return
	else
		dw_agenda_prof.setitem(donde,'hora',datetime(date('1900-01-01'),time(emp_v,0,0)))
	end if
end if
if emp_n<>-1 and emp_n<emp_v and emp_v<>-1 then
	//cambio el comienzo de un intervalo viejo
	if dw_agenda_prof.getitemdatetime(donde,'hora')<>datetime(date('1900-01-01'),time(emp_n,0,0)) then
		dw_agenda_prof.setitem(donde,'hora',datetime(date('1900-01-01'),time(emp_n,0,0)))
	end if
	if dw_agenda_prof.getitemnumber(donde,'duracion')<>(k -emp_n)*60 then dw_agenda_prof.setitem(donde,'duracion',(k -emp_n)*60)
else
	if dw_agenda_prof.getitemnumber(donde,'duracion')<>(k -emp_v)*60 then dw_agenda_prof.setitem(donde,'duracion',(k -emp_v)*60)
end if

end event

event chequea(integer row, integer col, boolean repintar);if i_tipo ='0' then //especialistas
	if dw_profes.getitemstring(1,'especialista')='' or isnull(dw_profes.getitemstring(1,'especialista')) then return
elseif i_tipo = '1' then
	if dw_profes.getitemstring(1,'anestesiologo')='' or isnull(dw_profes.getitemstring(1,'anestesiologo')) then return
elseif i_tipo = '2' then
	if dw_profes.getitemstring(1,'instrumentador')='' or isnull(dw_profes.getitemstring(1,'instrumentador')) then return
elseif i_tipo = '3' then
	if dw_profes.getitemstring(1,'circulante')='' or isnull(dw_profes.getitemstring(1,'circulante')) then return
elseif i_tipo = '4' then
	if dw_profes.getitemstring(1,'auxiliarqx')='' or isnull(dw_profes.getitemstring(1,'auxiliarqx')) then return
elseif i_tipo = '5' then
	if dw_profes.getitemstring(1,'enfermero')='' or isnull(dw_profes.getitemstring(1,'enfermero')) then return
elseif i_tipo = '6' then
	if dw_profes.getitemstring(1,'auxiliarenf')='' or isnull(dw_profes.getitemstring(1,'auxiliarenf')) then return
elseif i_tipo = '7' then
	if dw_profes.getitemstring(1,'camillero')='' or isnull(dw_profes.getitemstring(1,'camillero')) then return
end if
if (isnull(dw_profes.getitemstring(1,'cesp')) or dw_profes.getitemstring(1,'cesp')='') and idw_espe.RowCount() > 0 then
	if repintar then messagebox("Atención",'Debe escoger la especialidad del profesional')
	return
end if
string cual
long k
cual = string(col)
if col < 0 or col > 23 then
	messageBox('fila'+string(row),col)
end if
if rb_asig.checked then //ocupar
	if getitemstring(row,'ocup'+cual)<>'0' or getitemstring(row,'esta'+cual)<>'0' then return
	if getitemstring(row,'sel'+cual)= i_letra and i_letra = i_ctrl then
		setitem(row,'sel'+cual,'0')
	elseif i_letra = i_ctrl then
		setitem(row,'sel'+cual,i_letra)
	end if
else //desocupar
	if getitemstring(row,'ocup'+cual)=i_letra or getitemstring(row,'esta'+cual)<> i_letra then return
	if getitemstring(row,'sel'+cual) = i_letra and i_letra = i_ctrl then
		setitem(row,'sel'+cual,'0')
	else
		k=long(cual) +1
		do while k<=23
			if getitemstring(row,'ocup'+string(k)) = i_letra and getitemstring(row,'esta'+string(k))=i_letra and getitemnumber(row,'emp'+string(k))=getitemnumber(row,'emp'+cual) then 
				if repintar then messagebox("Atención",'Este intervalo ya no se puede cambiar porque tiene Programación más adelante')
				return
			end if
			if getitemnumber(row,'emp'+string(k))<>getitemnumber(row,'emp'+cual) then exit
			k ++
		loop
		setitem(row,'sel'+cual,i_letra)
	end if
end if
if repintar then setredraw(repintar)

end event

event mousemove;if click then
	if w_programa_sala2.pointerx()>=i_x and w_programa_sala2.pointery()>=i_y then
		
		gb_2.x=i_x
		gb_2.y=w_programa_sala2.pointery()
		gb_2.width=w_programa_sala2.pointerx() - i_x
		
	
		gb_6.x=w_programa_sala2.pointerx()
		gb_6.y=i_y
		gb_6.height=w_programa_sala2.pointery() - i_y
	elseif w_programa_sala2.pointerx()>=i_x and w_programa_sala2.pointery()<=i_y then
		
		gb_2.x=i_x
		gb_2.y=i_y
		gb_2.width=w_programa_sala2.pointerx() -i_x
		
		gb_6.x=w_programa_sala2.pointerx() 
		gb_6.y= w_programa_sala2.pointery() 
		gb_6.height=i_y - w_programa_sala2.pointery() 
	elseif w_programa_sala2.pointerx()<=i_x and w_programa_sala2.pointery()>=i_y then
		
		gb_2.x=w_programa_sala2.pointerx()
		gb_2.y=w_programa_sala2.pointery()
		gb_2.width= i_x - w_programa_sala2.pointerx()
		
	
		gb_6.x=i_x
		gb_6.y= i_y
		gb_6.height=w_programa_sala2.pointery() - i_y 
	elseif w_programa_sala2.pointerx()<=i_x and w_programa_sala2.pointery()<=i_y then

		
		gb_2.x=w_programa_sala2.pointerx()
		gb_2.y=i_y
		gb_2.width=i_x - w_programa_sala2.pointerx() 
		

		
		gb_6.x=i_x
		gb_6.y= w_programa_sala2.pointery() 
		gb_6.height=i_y - w_programa_sala2.pointery() 
	end if
	gb_2.visible=true
	gb_6.visible=true
	setredraw(true)
end if
end event

event constructor;//this.settransobject(sqlca)
this.modify('datawindow.color='+string(rgb(212,208,200)))
end event

event itemfocuschanged;if row<1 then return
string cual
if isnumber(right(this.getcolumnname(),2)) then
	cual=right(this.getcolumnname(),2)
elseif isnumber(right(this.getcolumnname(),1)) then
	cual=right(this.getcolumnname(),1)
else
	return
end if
string dia
choose case daynumber(date(getitemdatetime(row,'fecha')))
	case 1
		dia=' Domingo '
	case 2
		dia=' Lunes '
	case 3
		dia=' Martes '
	case 4
		dia=' Miercoles '
	case 5
		dia=' Jueves '
	case 6
		dia=' Viernes '
	case 7
		dia=' Sábado '
end choose
st_fecha_hora.text=dia+string(getitemdatetime(row,'fecha'),'dd-mmm-yyyy')+' '+string(time(cual),'hh:mm AM/PM')
if getitemnumber(row,string(dwo.name)) = 0 then 
	dw_det.reset()
	return
end if
dw_det.retrieve(dw_sala.getitemstring(1,1),this.getitemdatetime(row,'fecha'),long(cual))
commit;

end event

event clicked;if row<1 or dwo.type='datawindow' or (left(dwo.name,3)<>'esp' and left(dwo.name,3)<>'ane' and left(dwo.name,3)<>'ins' and left(dwo.name,3)<>'cir' and left(dwo.name,3)<>'aqx' and left(dwo.name,3)<>'enf' and left(dwo.name,3)<>'xen' and left(dwo.name,3)<>'cam') then return
fila=row
string cual
if isnumber(right(dwo.name,2)) then
	cual = right(dwo.name,2)
elseif isnumber(right(dwo.name,1)) then
	cual = right(dwo.name,1)
end if
colu = long(cual)
cual = left(dwo.name,3)
if cual = 'esp' then
	i_ctrl = 'E'
elseif cual = 'ane' then
	i_ctrl = 'A'
elseif	cual = 'ins' then
	i_ctrl = 'I'
elseif cual = 'cir' then
	i_ctrl = 'C'
elseif cual = 'aqx' then
	i_ctrl = 'Q'
elseif cual = 'enf' then
	i_ctrl = 'F'
elseif cual = 'xen' then
	i_ctrl = 'X'
elseif cual ='cam' then 
	i_ctrl = 'M'
end if

click=true
i_x=w_programa_sala2.pointerx()
i_y=w_programa_sala2.pointery()

//mle_1.Text = mle_1.Text + 'clicked '+string(row)+'-'+cual +"~r~n"

//this.post event clickup(1,1,row,dwo)
//event clickup(1,1,row,dwo)

end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3415
integer height = 1800
long backcolor = 67108864
string text = "Programación del Profesional"
long tabtextcolor = 33554432
string picturename = "medico.ico"
long picturemaskcolor = 536870912
string powertiptext = "Muestra la programación en el mes del profesional seleccionado"
st_28 st_28
st_27 st_27
st_22 st_22
st_21 st_21
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
dw_resu_profe dw_resu_profe
end type

on tp_2.create
this.st_28=create st_28
this.st_27=create st_27
this.st_22=create st_22
this.st_21=create st_21
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.dw_resu_profe=create dw_resu_profe
this.Control[]={this.st_28,&
this.st_27,&
this.st_22,&
this.st_21,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.dw_resu_profe}
end on

on tp_2.destroy
destroy(this.st_28)
destroy(this.st_27)
destroy(this.st_22)
destroy(this.st_21)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.dw_resu_profe)
end on

type st_28 from statictext within tp_2
integer x = 18
integer y = 744
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb( 240,240,240 ) 
end event

type st_27 from statictext within tp_2
integer x = 18
integer y = 788
integer width = 233
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Libre"
boolean focusrectangle = false
end type

type st_22 from statictext within tp_2
integer x = 18
integer y = 648
integer width = 233
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Urgencias"
boolean focusrectangle = false
end type

type st_21 from statictext within tp_2
integer x = 18
integer y = 592
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(210,210,210 ) 
end event

type st_10 from statictext within tp_2
integer x = 18
integer y = 496
integer width = 233
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cons. Ext."
boolean focusrectangle = false
end type

type st_9 from statictext within tp_2
integer x = 18
integer y = 444
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb( 230 , 230 , 192 ) 
end event

type st_8 from statictext within tp_2
integer x = 18
integer y = 332
integer width = 201
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hospital."
boolean focusrectangle = false
end type

type st_7 from statictext within tp_2
integer x = 18
integer y = 280
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_6 from statictext within tp_2
integer x = 18
integer y = 160
integer width = 201
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sala QX"
boolean focusrectangle = false
end type

type st_5 from statictext within tp_2
integer x = 18
integer y = 108
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event constructor;this.backcolor=rgb(220,192,192)
end event

type dw_resu_profe from datawindow within tp_2
integer x = 265
integer y = 32
integer width = 3150
integer height = 1520
integer taborder = 90
string title = "none"
string dataobject = "dw_horas_profe"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;modify('datawindow.color='+string(rgb(212,208,200)))

end event

type dw_tipo from datawindow within w_programa_sala2
integer x = 55
integer y = 200
integer width = 1344
integer height = 132
integer taborder = 20
string title = "none"
string dataobject = "dw_tipo_sala"
boolean border = false
boolean livescroll = true
end type

event itemchanged;tab_1.tp_1.dw_agenda.reset()
dw_det.reset()
st_fecha_hora.text=''
idw_sala.retrieve(data)
dw_sala.setitem(1,1,'')
this.accepttext()
end event

event constructor;settransobject(sqlca)
insertrow(1)
end event

type dw_ano_mes1 from datawindow within w_programa_sala2
integer x = 55
integer y = 1936
integer width = 594
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "dw_ano_mes"
boolean border = false
boolean livescroll = true
end type

event constructor;//this.insertrow(1)
//this.setitem(1,'anyo',year(today()))
//this.setitem(1,'mes',month(today()))
//this.triggerevent(itemchanged!)
end event

event itemchanged;//this.accepttext()
//int mes,anyo
//mes=this.getitemnumber(1,'mes')
//anyo=this.getitemnumber(1,'anyo')
//inicia=datetime(date(anyo,mes,1))
//if isdate('31/'+string(mes)+'/'+string(anyo)) then
//	termina=datetime(date(anyo,mes,31))
//else
//	if isdate('30/'+string(mes)+'/'+string(anyo)) then
//		termina=datetime(date(anyo,mes,30))
//	else
//		if isdate('29/'+string(mes)+'/'+string(anyo)) then
//			termina=datetime(date(anyo,mes,29))
//		else
//			termina=datetime(date(anyo,mes,28))
//		end if
//	end if
//end if
//dw_sala.triggerevent(itemchanged!)
//dw_profes.setcolumn('especialista')
//dw_profes.triggerevent(itemchanged!)
end event

type pb_1 from picturebutton within w_programa_sala2
integer x = 1056
integer y = 44
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &g"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Cambios [Alt+G]"
end type

event clicked;LONG J,K,donde
int emp_n=-1,emp_v=-1
datawindow dw
string espe

if isNull(i_prof) or i_prof = '' then
	MessageBox('Atención','Seleccione el profesional')
	Return 0
end if
espe=dw_profes.getitemstring(1,'cesp')
boolean ocup
dw=tab_1.tp_1.dw_agenda
setpointer(hourglass!)
dw_agenda_prof.retrieve(i_prof,inicia,termina,dw_sala.getitemstring(1,1),espe)
for j=1 to dw.rowcount()
	if rb_asig.checked then //ocupando
		for k=0 to 23
			if dw.getitemstring(j,'sel'+string(k))<>'0' and emp_n=-1  and emp_v = -1 then //empezo uno nuevo
				emp_n=k
			end if
			if dw.getitemstring(j,'esta'+string(k))<>'0' and emp_v=-1 then //empezo uno viejo
				emp_v=k
			end if
			if dw.getitemstring(j,'ocup'+string(k))<>'0' and dw.getitemstring(j,'esta'+string(k))<>'0' then
				ocup=true
			end if
			if ((dw.getitemstring(j,'sel'+string(k))='0' and emp_n>=0)or(dw.getitemstring(j,'ocup'+string(k))<>'0' and dw.getitemstring(j,'esta'+string(k))<>'0' and emp_n>=0)) and ocup or(dw.getitemstring(j,'sel'+string(k))='0' and emp_n>=0 and emp_v=-1)then 
				//termino un intervalo nuevo
				if emp_n<>-1 and emp_v<>-1  and ocup then
					tab_1.tp_1.dw_agenda.event insert_new(j,emp_v,emp_n,emp_v,i_prof,espe)
					emp_n=-1
				else
					tab_1.tp_1.dw_agenda.event insert_new(j,k,emp_n,emp_v,i_prof,espe)
					emp_n=-1
					ocup=false
					if emp_v<>k then emp_v=-1
				end if
			end if
			if (dw.getitemstring(j,'sel'+string(k))='0' and dw.getitemstring(j,'esta'+string(k))='0' and (emp_n<>-1  or emp_v<>-1 )) or (emp_v<>-1 and emp_v<>k and dw.getitemstring(j,'esta'+string(k))<>'0' and dw.getitemnumber(j,'emp'+string(k))<>emp_v and (emp_v<=dw.getitemnumber(j,'emp'+string(k)) or dw.getitemnumber(j,'emp'+string(k))=-1))then //<>emp_v
				//termino un intervalo que ya estaba
				tab_1.tp_1.dw_agenda.event cambia_viejo(j,k,emp_n,emp_v)
				if dw.getitemstring(j,'esta'+string(k))<>'0'then 
					emp_v=k
				else
					emp_v=-1
				end if
				if dw.getitemstring(j,'ocup'+string(k))<>'0'then 
					ocup=true
				else
					ocup=false
				end if
				emp_n=-1
			end if
		next
		if emp_v<>-1 and k=24 then //era uno viejo    emp_n<>-1 and emp_v<>-1
			tab_1.tp_1.dw_agenda.event cambia_viejo(j,24,emp_n,emp_v)
		end if
		if k=24 and emp_n<>-1 then //era uno nuevo   emp_v=-1 and emp_n<>-1
			tab_1.tp_1.dw_agenda.event insert_new(j,24,emp_n,emp_v,i_prof,espe)
		end if
		ocup=false
		emp_n=-1
		emp_v=-1
	else //desocupando
		long reco,ciclo
		boolean borrar=true
		for k=0 to 23
			if dw.getitemstring(j,'sel'+string(k))<>'0' then
				reco=k +1
				do while reco<=24
					if reco=24 then
						if dw.getitemnumber(j,'emp'+string(k))<23 then borrar=false
						dw.setitem(j,'sel'+string(k),'0')
						dw.setitem(j,'esta'+string(k),'0')
						exit
					end if
					if k<>dw.getitemnumber(j,'emp'+string(k)) then borrar=false
					if k=dw.getitemnumber(j,'emp'+string(k)) and dw.getitemstring(j,'sel'+string(reco))=i_letra and dw.getitemnumber(j,'emp'+string(reco))=dw.getitemnumber(j,'emp'+string(k)) then
						dw.setitem(j,'sel'+string(reco),'0')
						dw.setitem(j,'esta'+string(reco),'0')
						if reco=23 then
							dw.setitem(j,'sel'+string(k),'0')
							dw.setitem(j,'esta'+string(k),'0')
							k=reco
							exit
						elseif dw.getitemnumber(j,'emp'+string(reco +1))<>dw.getitemnumber(j,'emp'+string(k)) then
							dw.setitem(j,'sel'+string(k),'0')
							dw.setitem(j,'esta'+string(k),'0')
							k=reco
							exit
						end if
					else
						if dw.getitemnumber(j,'emp'+string(reco))<>dw.getitemnumber(j,'emp'+string(k)) then
							//if reco>k +1 or dw.getitemnumber(j,'emp'+string(reco))=-1 then borrar=false
							dw.setitem(j,'sel'+string(k),'0')
							dw.setitem(j,'esta'+string(k),'0')
							k= reco -1
							exit
						elseif dw.getitemstring(j,'sel'+string(reco))<>'0' then
							dw.setitem(j,'sel'+string(reco),'0')
							dw.setitem(j,'esta'+string(reco),'0')
						else
							borrar=false
						end if
					end if
					reco ++
				loop
				if borrar then
					donde=dw_agenda_prof.find('date(fecha)=date("'+string(date(dw.getitemdatetime(j,'fecha')),'yyyy-mm-dd')+'") and hour(time(hora))='+string(dw.getitemnumber(j,'emp'+string(k))),1,dw_agenda_prof.rowcount())
					if donde=0 then
						messagebox("Atención",'No se puede encontrar el intervalo del dia '+string(j)+' que comienza a las '+string(dw.getitemnumber(j,'emp'+string(k)))+' para borrarlo')
					else
						dw_agenda_prof.deleterow(donde)
					end if
				end if
				borrar=true
			end if
		next
	end if
next
if rb_asig.checked then
	if dw_agenda_prof.update()=-1 then
		rollback;
		return
	end if
	commit;
	pb_2.triggerevent(clicked!)
end if
if not rb_asig.checked then 
	rb_asig.checked=true
	if dw_agenda_prof.update()=-1 then
		rollback;
		pb_2.triggerevent(clicked!)
		return
	end if
	event clicked()
	rb_asig.checked=false
	rb_des.checked=true
end if

end event

type dw_profes from datawindow within w_programa_sala2
event p_itemchanged ( )
integer x = 14
integer y = 496
integer width = 1765
integer height = 436
integer taborder = 40
string title = "none"
string dataobject = "dw_prog_prof_qx2"
boolean border = false
boolean livescroll = true
end type

event p_itemchanged();dwobject este
string dato
long j,k
accepttext()
choose case this.getcolumnname()
	case 'tipo'
		if this.gettext()='0' then
			this.setcolumn('especialista')
			este = this.object.especialista
			dato = this.getitemstring(1,'especialista')
			i_letra = 'E'
		elseif this.gettext()='1' then
			this.setcolumn('anestesiologo')
			este = this.object.anestesiologo
			dato = this.getitemstring(1,'anestesiologo')
			i_letra = 'A'
		elseif this.gettext()='2' then
			this.setcolumn('instrumentador')
			este = this.object.instrumentador
			dato = this.getitemstring(1,'instrumentador')
			i_letra = 'I'
		elseif this.gettext()='3' then
			this.setcolumn('circulante')
			este = this.object.circulante
			dato = this.getitemstring(1,'circulante')
			i_letra = 'C'
		elseif this.gettext()='4' then
			this.setcolumn('auxiliarqx')
			este = this.object.auxiliarqx
			dato = this.getitemstring(1,'auxiliarqx')
			i_letra = 'Q'
		elseif this.gettext()='5' then
			this.setcolumn('Enfermero')
			este = this.object.Enfermero
			dato = this.getitemstring(1,'Enfermero')
			i_letra = 'F'
		elseif this.gettext()='6' then
			this.setcolumn('auxiliarenf')
			este = this.object.auxiliarenf
			dato = this.getitemstring(1,'auxiliarenf')
			i_letra = 'X'
		elseif this.gettext()='7' then
			this.setcolumn('camillero')
			este = this.object.camillero
			dato = this.getitemstring(1,'camillero')
			i_letra = 'M'
		end if
		i_tipo = GetItemString(1,'tipo')
		this.post event itemchanged(1,este,dato)
	case 'especialista'
		tab_1.tp_1.dw_agenda.event desocupa()
		if this.getitemstring(1,'especialista')='' or isnull(this.getitemstring(1,'especialista')) then
			idw_espe.reset()
			this.setitem(1,'cesp','')
			tab_1.tp_2.dw_resu_profe.reset()
			i_prof = ''
			return
		end if
		i_prof = GetItemString(1,'especialista')
		idw_espe.retrieve(this.getitemstring(1,'especialista'),'0')
		sqlca.autocommit=true
		tab_1.tp_2.dw_resu_profe.retrieve(this.getitemstring(1,'especialista'),inicia,termina)
		if idw_espe.rowcount()=1 then 
			this.setitem(1,'cesp',idw_espe.getitemstring(1,1))
			dw_resu_prof.retrieve(this.getitemstring(1,'especialista'),inicia,termina)// en retrieveend tiene codigo
		else
			this.setitem(1,'cesp','')
			tab_1.tp_1.dw_agenda.event desocupa()
		end if
		sqlca.autocommit=false
	case 'anestesiologo'
		tab_1.tp_1.dw_agenda.event desocupa()
		if this.getitemstring(1,'anestesiologo')='' or isnull(this.getitemstring(1,'anestesiologo')) then 
			idw_espe.reset()
			this.setitem(1,'cesp','')
			tab_1.tp_2.dw_resu_profe.reset()
			i_prof = ''
			return
		end if
		i_prof = GetItemString(1,'anestesiologo')
		idw_espe.retrieve(this.getitemstring(1,'anestesiologo'),'1')
		sqlca.autocommit=true
		tab_1.tp_2.dw_resu_profe.retrieve(this.getitemstring(1,'anestesiologo'),inicia,termina)
		if idw_espe.rowcount()=1 then 
			this.setitem(1,'cesp',idw_espe.getitemstring(1,1))
			dw_resu_prof.retrieve(this.getitemstring(1,'anestesiologo'),inicia,termina)// en retrieveend tiene codigo
		else
			this.setitem(1,'cesp','')
			tab_1.tp_1.dw_agenda.event desocupa()
		end if
		sqlca.autocommit=false
	case 'cesp'
		tab_1.tp_1.dw_agenda.event deselec()
		tab_1.tp_1.dw_agenda.event desocupa()
		sqlca.autocommit=true
		dw_resu_prof.retrieve(i_prof,inicia,termina)
		sqlca.autocommit=false
	case else
		tab_1.tp_1.dw_agenda.event desocupa()
		if this.getitemstring(1,getcolumnname())='' or isnull(this.getitemstring(1,getcolumnname())) then 
			idw_espe.reset()
			this.setitem(1,'cesp','')
			tab_1.tp_2.dw_resu_profe.reset()
			i_prof = ''
			return
		end if
		i_prof = GetItemString(1,getcolumnname())
		idw_espe.retrieve(this.getitemstring(1,getcolumnname()),GetItemString(1,'tipo'))
		sqlca.autocommit=true
		tab_1.tp_2.dw_resu_profe.Retrieve(this.getitemstring(1,getColumnName()),inicia,termina)
		if idw_espe.rowcount()=1 then 
			this.setitem(1,'cesp',idw_espe.getitemstring(1,1))
			dw_resu_prof.retrieve(this.getitemstring(1,getcolumnname()),inicia,termina)// en retrieveend tiene codigo
		else
			this.setitem(1,'cesp','')
			tab_1.tp_1.dw_agenda.event desocupa()
		end if
		sqlca.autocommit=false
end choose

end event

event constructor;this.settransobject(sqlca)

this.getchild('cesp',idw_espe)
idw_espe.settransobject(sqlca)

this.getchild('camillero',idw_cami)
idw_cami.settransobject(sqlca)
idw_cami.retrieve('%')

this.getchild('auxiliarenf',idw_auxiliarenf)
idw_auxiliarenf.settransobject(sqlca)
idw_auxiliarenf.retrieve('%')

this.getchild('enfermero',idw_enfermero)
idw_enfermero.settransobject(sqlca)
idw_enfermero.retrieve('%')

this.getchild('auxiliarqx',idw_auxiliarqx)
idw_auxiliarqx.settransobject(sqlca)
idw_auxiliarqx.retrieve('%')

this.getchild('circulante',idw_circulante)
idw_circulante.settransobject(sqlca)
idw_circulante.retrieve('%')

this.getchild('instrumentador',idw_instrumentador)
idw_instrumentador.settransobject(sqlca)
idw_instrumentador.retrieve('%')

this.getchild('anestesiologo',idw_anestesiologo)
idw_anestesiologo.settransobject(sqlca)
idw_anestesiologo.retrieve('%')

this.getchild('especialista',idw_especialista)
idw_especialista.settransobject(sqlca)
idw_especialista.retrieve('%')

this.insertrow(1)
end event

event itemchanged;this.accepttext()
this.post event p_itemchanged()

end event

type gb_3 from groupbox within w_programa_sala2
integer x = 18
integer y = 968
integer width = 1774
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Acción"
borderstyle borderstyle = styleraised!
end type

type gb_4 from groupbox within w_programa_sala2
integer y = 1140
integer width = 1792
integer height = 768
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Profesionales en la fecha y Hora"
borderstyle borderstyle = styleraised!
end type

type dw_resu_prof from datawindow within w_programa_sala2
boolean visible = false
integer x = 3095
integer y = 4
integer width = 238
integer height = 100
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_sp_prog_prof"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.settransobject(sqlca)
end event

event retrieveend;if tab_1.tp_1.dw_agenda.rowcount()=0 then return
long j,fil,columna
string campo,letra
for j=1 to this.rowcount()
	fil=getitemnumber(j,'dia')
	columna=hour(time(getitemdatetime(j,'hora')))
	campo = this.getitemstring(j,'anestesia')
	if campo = '0' then
		letra='E'
	elseif campo = '1' then
		letra='A'
	elseif campo = '2' then
		letra='I'
	elseif campo = '3' then
		letra='C'
	elseif campo = '4' then
		letra='Q'
	elseif campo = '5' then
		letra='F'
	elseif campo = '6' then
		letra='X'
	elseif campo = '7' then
		letra='M'
	end if
	if getitemstring(j,'consult')=dw_sala.getitemstring(1,1) and getitemstring(j,'cesp') = dw_profes.getitemstring(1,'cesp') then
		tab_1.tp_1.dw_agenda.setitem(fil,'esta'+string(columna),letra)
		tab_1.tp_1.dw_agenda.setitem(fil,'emp'+string(columna),hour(time(getitemdatetime(j,'hora_emp'))))
		if not isnull(getitemdatetime(j,'hora_ocup')) then tab_1.tp_1.dw_agenda.setitem(fil,'ocup'+string(columna),letra)
	else //marcar cuando está en otros consultorios
		tab_1.tp_1.dw_agenda.setitem(fil,'ocup'+string(columna),letra)		
	end if
next

end event

type gb_6 from groupbox within w_programa_sala2
event clickup pbm_lbuttonup
event mousemove pbm_mousemove
boolean visible = false
integer x = 910
integer y = 184
integer width = 14
integer height = 132
integer taborder = 40
integer textsize = -2
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

event clickup;long xx,yy
string filas
xx=tab_1.tp_1.dw_agenda.pointerx()
yy=tab_1.tp_1.dw_agenda.pointery()
filas=tab_1.tp_1.dw_agenda.getobjectatpointer()
tab_1.tp_1.dw_agenda.event clickup(xx,yy,long(right(filas,len(filas) - pos(filas,'	'))),lf_dwo(left(filas,pos(filas,'	') -1)))
end event

event mousemove;long xx,yy
xx=tab_1.tp_1.dw_agenda.pointerx()
yy=tab_1.tp_1.dw_agenda.pointery()
tab_1.tp_1.dw_agenda.event mousemove(xx,yy,1,tab_1.tp_1.dw_agenda.object.espe22)
end event

type dw_sala from datawindow within w_programa_sala2
integer x = 55
integer y = 332
integer width = 1559
integer height = 132
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_salasqx"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
this.getchild('cconsultorio',idw_sala)
idw_sala.settransobject(sqlca)
this.insertrow(1)
end event

event itemchanged;if this.gettext()='' or isnull(this.gettext()) then return
datetime inicio
long donde
inicio=inicia
tab_1.tp_1.dw_agenda.reset()
tab_1.tp_1.dw_agenda.setredraw(false)
do while inicio<=termina
	donde=tab_1.tp_1.dw_agenda.insertrow(0)
	tab_1.tp_1.dw_agenda.setitem(donde,'fecha',inicio)
	tab_1.tp_1.dw_agenda.setitem(donde,'dia',daynumber(date(inicio)))
	inicio=datetime(relativedate(date(inicio),1))
loop
sqlca.autocommit=true
dw_resumen.retrieve(this.gettext(),inicia,termina) // en el retrieveend de ese llena los ocupados
sqlca.autocommit=false
tab_1.tp_1.dw_agenda.setredraw(true)
dw_profes.setcolumn('tipo')
dw_profes.triggerevent(itemchanged!)
end event

type gb_2 from groupbox within w_programa_sala2
event clickup pbm_lbuttonup
event mousemove pbm_mousemove
boolean visible = false
integer x = 27
integer y = 184
integer width = 1765
integer height = 296
integer taborder = 100
integer textsize = -2
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

event clickup;long xx,yy
string filas
xx=tab_1.tp_1.dw_agenda.pointerx()
yy=tab_1.tp_1.dw_agenda.pointery()
filas=tab_1.tp_1.dw_agenda.getobjectatpointer()
tab_1.tp_1.dw_agenda.event clickup(xx,yy,long(right(filas,len(filas) - pos(filas,'	'))),lf_dwo(left(filas,pos(filas,'	') -1)))
end event

event mousemove;long xx,yy
xx=tab_1.tp_1.dw_agenda.pointerx()
yy=tab_1.tp_1.dw_agenda.pointery()
tab_1.tp_1.dw_agenda.event mousemove(xx,yy,1,tab_1.tp_1.dw_agenda.object.espe22)
end event

type gb_1 from groupbox within w_programa_sala2
integer x = 32
integer y = 12
integer width = 960
integer height = 168
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Semana Programación"
end type

