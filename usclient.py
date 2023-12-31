# Temperature_node.set_writable()
# Temperature_node1.set_writable()
import time
import opcua
from PySide2.QtCore import QObject, Signal, Slot, Property
from opcua import Client, ua


# Assign endpoint URL


class opcClient(QObject):
    def __init__(self):
        QObject.__init__(self)
        url = "192.168.0.10"
        port = 4840
        endpoint = "opc.tcp://{}:{}".format(url, port)
        print(endpoint)
        # Assign endpoint url on the OPC UA client  address space
        self.myclient = Client(endpoint)
        try:
            self.myclient.connect()
        except:
            print("opc连接失败")
            self.status = False
        else:
            self.status = True
            self.M_Start = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Start"')
            self.M_Reset = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Reset"')
            self.M_Mode = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Mode"')
            self.M_DataReady = self.myclient.get_node('ns=3;s="OPCUA"."1#M_DataReady"')
            self.M_AlarmLock = self.myclient.get_node('ns=3;s="OPCUA"."1#M_AlarmLock"')
            self.E_STOP = self.myclient.get_node('ns=3;s="OPCUA"."1#E-STOP"')
            self.M_BatchSize = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Batchsize"')
            self.M_CycleCounter = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CycleCounter"')
            self.M_AlarmNumber = self.myclient.get_node('ns=3;s="OPCUA"."1#M_AlarmNumber"')
            self.M_Ready = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Ready"')
            self.M_Alarm = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Alarm"')
            self.M_Sonics = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Sonics"')
            self.M_PPM = self.myclient.get_node('ns=3;s="OPCUA"."1#M_PPM"')
            self.M_CurrentTune = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentTune"')
            self.M_CurrentFre_offset = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Current Fre_offset"')
            self.M_CurrentAmplitude = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentAmplitude"')
            self.M_CurrentPower = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentPower"')
            self.M_PowerArray = self.myclient.get_node('ns=3;s="OPCUA"."1#M_PowerArray"')
            self.M_PowerLength = self.myclient.get_node('ns=3;s="OPCUA"."1#M_PowerLength"')
            self.M_Start2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Start"')
            self.M_Reset2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Reset"')
            self.M_Mode2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Mode"')
            self.M_DataReady2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_DataReady"')
            self.M_AlarmLock2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_AlarmLock"')
            self.E_STOP2 = self.myclient.get_node('ns=3;s="OPCUA"."2#E-STOP"')
            self.M_BatchSize2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Batchsize"')
            self.M_CycleCounter2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CycleCounter"')
            self.M_AlarmNumber2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_AlarmNumber"')
            self.M_Ready2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Ready"')
            self.M_Alarm2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Alarm"')
            self.M_Sonics2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Sonics"')
            self.M_PPM2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_PPM"')
            self.M_CurrentTune2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentTune"')
            self.M_CurrentFre_offset2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Current Fre_offset"')
            self.M_CurrentAmplitude2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentAmplitude"')
            self.M_CurrentPower2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentPower"')
            self.M_PowerArray2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_PowerArray"')
            self.M_PowerLength2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_PowerLength"')
            self.M_Start3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Start"')
            self.M_Reset3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Reset"')
            self.M_Mode3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Mode"')
            self.M_DataReady3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_DataReady"')
            self.M_AlarmLock3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_AlarmLock"')
            self.E_STOP3 = self.myclient.get_node('ns=3;s="OPCUA"."3#E-STOP"')
            self.M_BatchSize3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Batchsize"')
            self.M_CycleCounter3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CycleCounter"')
            self.M_AlarmNumber3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_AlarmNumber"')
            self.M_Ready3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Ready"')
            self.M_Alarm3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Alarm"')
            self.M_Sonics3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Sonics"')
            self.M_PPM3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_PPM"')
            self.M_CurrentTune3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentTune"')
            self.M_CurrentFre_offset3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Current Fre_offset"')
            self.M_CurrentAmplitude3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentAmplitude"')
            self.M_CurrentPower3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentPower"')
            self.M_PowerArray3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_PowerArray"')
            self.M_PowerLength3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_PowerLength"')
            self.M_Start4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Start"')
            self.M_Reset4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Reset"')
            self.M_Mode4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Mode"')
            self.M_DataReady4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_DataReady"')
            self.M_AlarmLock4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_AlarmLock"')
            self.E_STOP4 = self.myclient.get_node('ns=3;s="OPCUA"."4#E-STOP"')
            self.M_BatchSize4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Batchsize"')
            self.M_CycleCounter4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CycleCounter"')
            self.M_AlarmNumber4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_AlarmNumber"')
            self.M_Ready4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Ready"')
            self.M_Alarm4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Alarm"')
            self.M_Sonics4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Sonics"')
            self.M_PPM4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_PPM"')
            self.M_CurrentTune4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentTune"')
            self.M_CurrentFre_offset4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Current Fre_offset"')
            self.M_CurrentAmplitude4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentAmplitude"')
            self.M_CurrentPower4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentPower"')
            self.M_PowerArray4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_PowerArray"')
            self.M_PowerLength4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_PowerLength"')
            self.subscribe = self.myclient.create_subscription(0, self)
            self.subNodesId()
            # Connect to server
            self.pstart1 = False
            self.pstart2 = False
            self.pstart3 = False
            self.pstart4 = False
            self.preSet1 = False
            self.preSet2 = False
            self.preSet3 = False
            self.preSet4 = False
            self.pdataReady1 = True
            self.pdataReady2 = True
            self.pdataReady3 = True
            self.pdataReady4 = True
            self.pestop1 = True
            self.pestop2 = True
            self.pestop3 = True
            self.pestop4 = True
            self.pcycleCounter1 = 0
            self.pcycleCounter2 = 0
            self.pcycleCounter3 = 0
            self.pcycleCounter4 = 0
            self.palarmNumber1 = 0
            self.palarmNumber3 = 0
            self.palarmNumber2 = 0
            self.palarmNumber4 = 0
            self.pbatchSize1 = 0
            self.pbatchSize2 = 0
            self.pbatchSize3 = 0
            self.pbatchSize4 = 0
            self.pmaxCurrentTune1 = ''
            self.pmaxCurrentTune2 = ''
            self.pmaxCurrentTune3 = ''
            self.pmaxCurrentTune4 = ''
            self.pminCurrentTune1 = ''
            self.pminCurrentTune2 = ''
            self.pminCurrentTune3 = ''
            self.pminCurrentTune4 = ''
            self.pmaxCurrentAmp1 = ''
            self.pmaxCurrentAmp2 = ''
            self.pmaxCurrentAmp3 = ''
            self.pmaxCurrentAmp4 = ''
            self.pminCurrentAmp1 = ''
            self.pminCurrentAmp2 = ''
            self.pminCurrentAmp3 = ''
            self.pminCurrentAmp4 = ''
            self.pmaxCurrentFre1 = ''
            self.pmaxCurrentFre2 = ''
            self.pmaxCurrentFre3 = ''
            self.pmaxCurrentFre4 = ''
            self.pminCurrentFre1 = ''
            self.pminCurrentFre2 = ''
            self.pminCurrentFre3 = ''
            self.pminCurrentFre4 = ''
            self.pmaxCurrentPower1 = ''
            self.pmaxCurrentPower2 = ''
            self.pmaxCurrentPower3 = ''
            self.pmaxCurrentPower4 = ''
            self.pminCurrentPower1 = ''
            self.pminCurrentPower2 = ''
            self.pminCurrentPower3 = ''
            self.pminCurrentPower4 = ''


    @Slot()
    def Stop(self):
        try:
            self.myclient.disconnect()
            self.status = False
        except:
            print("失败")

    # def reconnect(self):
    #     while True:
    #         try:
    #             print('00000000000000000000')
    #             self.connectOPCUA()
    #             time.sleep(4)
    #         except opcua.ua.StatusCodes.BadConnectionClosed:
    #             print("连接断开")

    def subNodesId(self):
        sub = self.subscribe.subscribe_data_change(self.M_Start)
        sub = self.subscribe.subscribe_data_change(self.M_Reset)
        sub = self.subscribe.subscribe_data_change(self.M_Mode)
        sub = self.subscribe.subscribe_data_change(self.M_DataReady)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmLock)
        sub = self.subscribe.subscribe_data_change(self.E_STOP)
        sub = self.subscribe.subscribe_data_change(self.M_BatchSize)
        sub = self.subscribe.subscribe_data_change(self.M_CycleCounter)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmNumber)
        sub = self.subscribe.subscribe_data_change(self.M_Ready)
        sub = self.subscribe.subscribe_data_change(self.M_Alarm)
        sub = self.subscribe.subscribe_data_change(self.M_Sonics)
        sub = self.subscribe.subscribe_data_change(self.M_PPM)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentTune)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentFre_offset)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentAmplitude)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentPower)
        sub = self.subscribe.subscribe_data_change(self.M_PowerArray)
        sub = self.subscribe.subscribe_data_change(self.M_PowerLength)
        sub = self.subscribe.subscribe_data_change(self.M_Start2)
        sub = self.subscribe.subscribe_data_change(self.M_Reset2)
        sub = self.subscribe.subscribe_data_change(self.M_Mode2)
        sub = self.subscribe.subscribe_data_change(self.M_DataReady2)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmLock2)
        sub = self.subscribe.subscribe_data_change(self.E_STOP2)
        sub = self.subscribe.subscribe_data_change(self.M_BatchSize2)
        sub = self.subscribe.subscribe_data_change(self.M_CycleCounter2)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmNumber2)
        sub = self.subscribe.subscribe_data_change(self.M_Ready2)
        sub = self.subscribe.subscribe_data_change(self.M_Alarm2)
        sub = self.subscribe.subscribe_data_change(self.M_Sonics2)
        sub = self.subscribe.subscribe_data_change(self.M_PPM2)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentTune2)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentFre_offset2)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentAmplitude2)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentPower2)
        sub = self.subscribe.subscribe_data_change(self.M_PowerArray2)
        sub = self.subscribe.subscribe_data_change(self.M_PowerLength2)
        sub = self.subscribe.subscribe_data_change(self.M_Start3)
        sub = self.subscribe.subscribe_data_change(self.M_Reset3)
        sub = self.subscribe.subscribe_data_change(self.M_Mode3)
        sub = self.subscribe.subscribe_data_change(self.M_DataReady3)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmLock3)
        sub = self.subscribe.subscribe_data_change(self.E_STOP3)
        sub = self.subscribe.subscribe_data_change(self.M_BatchSize3)
        sub = self.subscribe.subscribe_data_change(self.M_CycleCounter3)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmNumber3)
        sub = self.subscribe.subscribe_data_change(self.M_Ready3)
        sub = self.subscribe.subscribe_data_change(self.M_Alarm3)
        sub = self.subscribe.subscribe_data_change(self.M_Sonics3)
        sub = self.subscribe.subscribe_data_change(self.M_PPM3)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentTune3)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentFre_offset3)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentAmplitude3)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentPower3)
        sub = self.subscribe.subscribe_data_change(self.M_PowerArray3)
        sub = self.subscribe.subscribe_data_change(self.M_PowerLength3)
        sub = self.subscribe.subscribe_data_change(self.M_Start4)
        sub = self.subscribe.subscribe_data_change(self.M_Reset4)
        sub = self.subscribe.subscribe_data_change(self.M_Mode4)
        sub = self.subscribe.subscribe_data_change(self.M_DataReady4)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmLock4)
        sub = self.subscribe.subscribe_data_change(self.E_STOP4)
        sub = self.subscribe.subscribe_data_change(self.M_BatchSize4)
        sub = self.subscribe.subscribe_data_change(self.M_CycleCounter4)
        sub = self.subscribe.subscribe_data_change(self.M_AlarmNumber4)
        sub = self.subscribe.subscribe_data_change(self.M_Ready4)
        sub = self.subscribe.subscribe_data_change(self.M_Alarm4)
        sub = self.subscribe.subscribe_data_change(self.M_Sonics4)
        sub = self.subscribe.subscribe_data_change(self.M_PPM4)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentTune4)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentFre_offset4)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentAmplitude4)
        sub = self.subscribe.subscribe_data_change(self.M_CurrentPower4)
        sub = self.subscribe.subscribe_data_change(self.M_PowerArray4)
        sub = self.subscribe.subscribe_data_change(self.M_PowerLength4)

    sigOpcStatus = Signal(int, arguments=['status'])


    @Slot(result=bool)
    def currentEquipmentStatus(self):
        return self.status

    @Slot()
    def connectOPCUA(self):
        try:
            # self.myclient.disconnect()
            self.myclient.connect()
        except:
            # self.sigOpcStatus.emit(1)
            print("opc连接失败")
            self.status = False
        else:
            self.status = True
            self.subscribe = self.myclient.create_subscription(0, self)
            self.subNodesId()
            # self.sigOpcStatus.emit(0)

    start1_changed = Signal(bool)
    start2_changed = Signal(bool)
    start3_changed = Signal(bool)
    start4_changed = Signal(bool)

    reSet1_changed = Signal(bool)
    reSet2_changed = Signal(bool)
    reSet3_changed = Signal(bool)
    reSet4_changed = Signal(bool)

    mode1_changed = Signal(int)
    mode2_changed = Signal(int)
    mode3_changed = Signal(int)
    mode4_changed = Signal(int)

    dataReady1_changed = Signal(bool)
    dataReady2_changed = Signal(bool)
    dataReady3_changed = Signal(bool)
    dataReady4_changed = Signal(bool)

    alarmLock1_changed = Signal(bool)
    alarmLock2_changed = Signal(bool)
    alarmLock3_changed = Signal(bool)
    alarmLock4_changed = Signal(bool)

    estop1_changed = Signal(bool)
    estop2_changed = Signal(bool)
    estop3_changed = Signal(bool)
    estop4_changed = Signal(bool)

    batchSize1_changed = Signal(int)
    batchSize2_changed = Signal(int)
    batchSize3_changed = Signal(int)
    batchSize4_changed = Signal(int)

    cycleCounter1_changed = Signal(int)
    cycleCounter2_changed = Signal(int)
    cycleCounter3_changed = Signal(int)
    cycleCounter4_changed = Signal(int)

    alarmNumber1_changed = Signal(int)
    alarmNumber2_changed = Signal(int)
    alarmNumber3_changed = Signal(int)
    alarmNumber4_changed = Signal(int)

    ready1_changed = Signal(bool)
    ready2_changed = Signal(bool)
    ready3_changed = Signal(bool)
    ready4_changed = Signal(bool)

    alarm1_changed = Signal(int)
    alarm2_changed = Signal(int)
    alarm3_changed = Signal(int)
    alarm4_changed = Signal(int)

    sonics1_changed = Signal(bool)
    sonics2_changed = Signal(bool)
    sonics3_changed = Signal(bool)
    sonics4_changed = Signal(bool)

    ppm1_changed = Signal(int)
    ppm2_changed = Signal(int)
    ppm3_changed = Signal(int)
    ppm4_changed = Signal(int)

    currentTune1_changed = Signal(int)
    currentTune2_changed = Signal(int)
    currentTune3_changed = Signal(int)
    currentTune4_changed = Signal(int)
    
    minCurrentTune1_changed = Signal(int)
    minCurrentTune2_changed = Signal(int)
    minCurrentTune3_changed = Signal(int)
    minCurrentTune4_changed = Signal(int)

    maxCurrentTune1_changed = Signal(int)
    maxCurrentTune2_changed = Signal(int)
    maxCurrentTune3_changed = Signal(int)
    maxCurrentTune4_changed = Signal(int)

    currentFre1_changed = Signal(int)
    currentFre2_changed = Signal(int)
    currentFre3_changed = Signal(int)
    currentFre4_changed = Signal(int)

    minCurrentFre1_changed = Signal(int)
    minCurrentFre2_changed = Signal(int)
    minCurrentFre3_changed = Signal(int)
    minCurrentFre4_changed = Signal(int)

    maxCurrentFre1_changed = Signal(int)
    maxCurrentFre2_changed = Signal(int)
    maxCurrentFre3_changed = Signal(int)
    maxCurrentFre4_changed = Signal(int)

    currentAmp1_changed = Signal(int)
    currentAmp2_changed = Signal(int)
    currentAmp3_changed = Signal(int)
    currentAmp4_changed = Signal(int)

    minCurrentAmp1_changed = Signal(int)
    minCurrentAmp2_changed = Signal(int)
    minCurrentAmp3_changed = Signal(int)
    minCurrentAmp4_changed = Signal(int)

    maxCurrentAmp1_changed = Signal(int)
    maxCurrentAmp2_changed = Signal(int)
    maxCurrentAmp3_changed = Signal(int)
    maxCurrentAmp4_changed = Signal(int)

    currentPower1_changed = Signal(int)
    currentPower2_changed = Signal(int)
    currentPower3_changed = Signal(int)
    currentPower4_changed = Signal(int)

    minCurrentPower1_changed = Signal(int)
    minCurrentPower2_changed = Signal(int)
    minCurrentPower3_changed = Signal(int)
    minCurrentPower4_changed = Signal(int)

    maxCurrentPower1_changed = Signal(int)
    maxCurrentPower2_changed = Signal(int)
    maxCurrentPower3_changed = Signal(int)
    maxCurrentPower4_changed = Signal(int)


    # powerArray1_changed = Signal(bool)
    # powerArray2_changed = Signal(bool)
    # powerArray3_changed = Signal(bool)
    # powerArray4_changed = Signal(bool)

    powerLength1_changed = Signal(int)
    powerLength2_changed = Signal(int)
    powerLength3_changed = Signal(int)
    powerLength4_changed = Signal(int)

    @Slot(result=bool)
    def getReady1(self):
        return self.M_Ready.get_value()

    @Slot(result=bool)
    def getReady2(self):
        return self.M_Ready2.get_value()

    @Slot(result=bool)
    def getReady3(self):
        return self.M_Ready3.get_value()

    @Slot(result=bool)
    def getReady4(self):
        return self.M_Ready4.get_value()

    @Slot(result=int)
    def getAlarm1(self):
        return self.M_Alarm.get_value()

    @Slot(result=int)
    def getAlarm2(self):
        return self.M_Alarm2.get_value()

    @Slot(result=int)
    def getAlarm3(self):
        return self.M_Alarm3.get_value()

    @Slot(result=int)
    def getAlarm4(self):
        return self.M_Alarm4.get_value()

    @Slot(result=bool)
    def getDataReady1(self):
        return self.M_DataReady.get_value()

    @Slot(result=bool)
    def getDataReady2(self):
        return self.M_DataReady2.get_value()

    @Slot(result=bool)
    def getDataReady3(self):
        return self.M_DataReady3.get_value()

    @Slot(result=bool)
    def getDataReady4(self):
        return self.M_DataReady4.get_value()

    @Slot(result=bool)
    def getSonics1(self):
        return self.M_Sonics.get_value()

    @Slot(result=bool)
    def getSonics2(self):
        return self.M_Sonics2.get_value()

    @Slot(result=bool)
    def getSonics3(self):
        return self.M_Sonics3.get_value()

    @Slot(result=bool)
    def getSonics4(self):
        return self.M_Sonics4.get_value()

    @Slot(int, int)
    def updateStart(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.M_Start.set_value(dv)
        elif index == 1:
            self.M_Start2.set_value(dv)
        elif index == 2:
            self.M_Start3.set_value(dv)
        elif index == 3:
            self.M_Start4.set_value(dv)

    @Slot(int, int)
    def updateReset(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.M_Reset.set_value(dv)
        elif index == 1:
            self.M_Reset2.set_value(dv)
        elif index == 2:
            self.M_Reset3.set_value(dv)
        elif index == 3:
            self.M_Reset4.set_value(dv)

    @Slot(int, int)
    def updateMode(self, index, num):
        if index == 0:
            self.M_Mode.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_Mode2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_Mode3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_Mode4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateDataReady(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.M_DataReady.set_value(dv)
        elif index == 1:
            self.M_DataReady2.set_value(dv)
        elif index == 2:
            self.M_DataReady3.set_value(dv)
        elif index == 3:
            self.M_DataReady4.set_value(dv)

    @Slot(int, int)
    def updateAlarmLock(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.M_AlarmLock.set_value(dv)
        elif index == 1:
            self.M_AlarmLock2.set_value(dv)
        elif index == 2:
            self.M_AlarmLock3.set_value(dv)
        elif index == 3:
            self.M_AlarmLock4.set_value(dv)

    @Slot(int, int)
    def updateEstop(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.E_STOP.set_value(dv)
        elif index == 1:
            self.E_STOP2.set_value(dv)
        elif index == 2:
            self.E_STOP3.set_value(dv)
        elif index == 3:
            self.E_STOP4.set_value(dv)

    @Slot(int, int)
    def updateBatchSize(self, index, num):
        if index == 0:
            self.M_BatchSize.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_BatchSize2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_BatchSize3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_BatchSize4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateCycleCounter(self, index, num):
        if index == 0:
            self.M_CycleCounter.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_CycleCounter2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_CycleCounter3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_CycleCounter4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateAlarmNumber(self, index, num):
        if index == 0:
            self.M_AlarmNumber.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_AlarmNumber2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_AlarmNumber3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_AlarmNumber4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateReady(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.M_Ready.set_value(dv)
        elif index == 1:
            self.M_Ready2.set_value(dv)
        elif index == 2:
            self.M_Ready3.set_value(dv)
        elif index == 3:
            self.M_Ready4.set_value(dv)

    @Slot(int, int)
    def updateSonics(self, index, num):
        if num == 1:
            dv = ua.DataValue(True)
        else:
            dv = ua.DataValue(False)
        if index == 0:
            self.M_Sonics.set_value(dv)
        elif index == 1:
            self.M_Sonics2.set_value(dv)
        elif index == 2:
            self.M_Sonics3.set_value(dv)
        elif index == 3:
            self.M_Sonics4.set_value(dv)

    @Slot(int, int)
    def updatePPM(self, index, num):
        if index == 0:
            self.M_PPM.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_PPM2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_PPM3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_PPM4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateAlarm(self, index, num):
        if index == 0:
            self.M_Alarm.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_Alarm2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_Alarm3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_Alarm4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateCurrentTune(self, index, num):
        if index == 0:
            self.M_CurrentTune.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_CurrentTune2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_CurrentTune3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_CurrentTune4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateCurrentFre_offset(self, index, num):
        if index == 0:
            self.M_CurrentFre_offset.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_CurrentFre_offset2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_CurrentFre_offset3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_CurrentFre_offset4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateCurrentAmplitude(self, index, num):
        if index == 0:
            self.M_CurrentAmplitude.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_CurrentAmplitude2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_CurrentAmplitude3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_CurrentAmplitude4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updateCurrentPower(self, index, num):
        if index == 0:
            self.M_CurrentPower.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_CurrentPower2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_CurrentPower3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_CurrentPower4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

    @Slot(int, int)
    def updatePowerLength(self, index, num):
        if index == 0:
            self.M_PowerLength.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 1:
            self.M_PowerLength2.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 2:
            self.M_PowerLength3.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))
        elif index == 3:
            self.M_PowerLength4.set_value(ua.DataValue(ua.Variant(num, ua.VariantType.Int16)))

        # M_start

    @Slot(bool)
    def setStart1(self, val):
        self.pstart1 = val
        self.start1_changed.emit(val)

    @Slot(result=bool)
    def start1(self):
        return self.pstart1

    @Slot(bool)
    def setStart2(self, val):
        self.pstart2 = val
        self.start2_changed.emit(val)

    @Slot(result=bool)
    def start2(self):
        return self.pstart2

    @Slot(bool)
    def setStart3(self, val):
        self.pstart3 = val
        self.start3_changed.emit(val)

    @Slot(result=bool)
    def start3(self):
        return self.pstart3

    @Slot(bool)
    def setStart4(self, val):
        self.pstart4 = val
        self.start4_changed.emit(val)

    @Slot(result=bool)
    def start4(self):
        return self.pstart4

    # M_reSet
    @Slot(bool)
    def setReset1(self, val):
        self.preSet1 = val
        self.reSet1_changed.emit(val)

    @Slot(result=bool)
    def reSet1(self):
        return self.preSet1

    @Slot(bool)
    def setReset2(self, val):
        self.preSet2 = val
        self.reSet2_changed.emit(val)

    @Slot(result=bool)
    def reSet2(self):
        return self.preSet2

    @Slot(bool)
    def setReset3(self, val):
        self.preSet3 = val
        self.reSet3_changed.emit(val)

    @Slot(result=bool)
    def reSet3(self):
        return self.preSet3

    @Slot(bool)
    def setReset4(self, val):
        self.preSet4 = val
        self.reSet4_changed.emit(val)

    @Slot(result=bool)
    def reSet4(self):
        return self.preSet4

    # M_Mode
    @Slot(int)
    def setMode1(self, val):
        self.mode1 = val
        self.mode1_changed.emit(val)

    @Slot(result=int)
    def mode1(self):
        return self.mode1

    @Slot(int)
    def setMode2(self, val):
        self.mode2 = val
        self.mode2_changed.emit(val)

    @Slot(result=int)
    def mode2(self):
        return self.mode2

    @Slot(int)
    def setMode3(self, val):
        self.mode3 = val
        self.mode3_changed.emit(val)

    @Slot(result=int)
    def mode3(self):
        return self.mode3

    @Slot(int)
    def setMode4(self, val):
        self.mode4 = val
        self.mode4_changed.emit(val)

    @Slot(result=int)
    def mode4(self):
        return self.mode4

    # M_DataReady
    @Slot(bool)
    def setDataready1(self, val):
        self.pdataReady1 = val
        self.dataReady1_changed.emit(val)

    @Slot(result=bool)
    def dataReady1(self):
        return self.pdataReady1

    @Slot(bool)
    def setDataready2(self, val):
        self.pdataReady2 = val
        self.dataReady2_changed.emit(val)

    @Slot(result=bool)
    def dataReady2(self):
        return self.pdataReady2

    @Slot(bool)
    def setDataready3(self, val):
        self.pdataReady3 = val
        self.dataReady3_changed.emit(val)

    @Slot(result=bool)
    def dataReady3(self):
        return self.pdataReady3

    @Slot(bool)
    def setDataready4(self, val):
        self.pdataReady4 = val
        self.dataReady4_changed.emit(val)

    @Slot(result=bool)
    def dataReady4(self):
        return self.pdataReady4

    # Alarmlock
    @Slot(bool)
    def setAlarmlock1(self, val):
        self.alarmLock1 = val
        self.alarmLock1_changed.emit(val)

    @Slot(result=bool)
    def alarmLock1(self):
        return self.alarmLock1

    @Slot(bool)
    def setAlarmlock2(self, val):
        self.alarmLock2 = val
        self.alarmLock2_changed.emit(val)

    @Slot(result=bool)
    def alarmLock2(self):
        return self.alarmLock2

    @Slot(bool)
    def setAlarmlock3(self, val):
        self.alarmLock3 = val
        self.alarmLock3_changed.emit(val)

    @Slot(result=bool)
    def alarmLock3(self):
        return self.alarmLock3

    @Slot(bool)
    def setAlarmlock4(self, val):
        self.alarmLock4 = val
        self.alarmLock4_changed.emit(val)

    @Slot(result=bool)
    def alarmLock4(self):
        return self.alarmLock4

    # E_STOP
    @Slot(bool)
    def setEstop1(self, val):
        self.pestop1 = val
        self.estop1_changed.emit(val)

    @Slot(result=bool)
    def estop1(self):
        return self.pestop1

    @Slot(bool)
    def setEstop2(self, val):
        self.pestop2 = val
        self.estop2_changed.emit(val)

    @Slot(result=bool)
    def estop2(self):
        return self.pestop2

    @Slot(bool)
    def setEstop3(self, val):
        self.pestop3 = val
        self.estop3_changed.emit(val)

    @Slot(result=bool)
    def estop3(self):
        return self.pestop3

    @Slot(bool)
    def setEstop4(self, val):
        self.pestop4 = val
        self.estop4_changed.emit(val)

    @Slot(result=bool)
    def estop4(self):
        return self.pestop4

    # BatchSize
    @Slot(int)
    def setBatchSize1(self, val):
        self.pbatchSize1 = val
        self.batchSize1_changed.emit(val)

    @Slot(result=int)
    def batchSize1(self):
        return self.pbatchSize1

    @Slot(int)
    def setBatchSize2(self, val):
        self.pbatchSize2 = val
        self.batchSize2_changed.emit(val)

    @Slot(result=int)
    def batchSize2(self):
        return self.pbatchSize2

    @Slot(int)
    def setBatchSize3(self, val):
        self.pbatchSize3 = val
        self.batchSize3_changed.emit(val)

    @Slot(result=int)
    def batchSize3(self):
        return self.pbatchSize3

    @Slot(int)
    def setBatchSize4(self, val):
        self.pbatchSize4 = val
        self.batchSize4_changed.emit(val)

    @Slot(result=int)
    def batchSize4(self):
        return self.pbatchSize4

    # CycleCounter
    @Slot(int)
    def setCycleCounter1(self, val):
        self.pcycleCounter1 = val
        self.cycleCounter1_changed.emit(val)

    @Slot(result=int)
    def cycleCounter1(self):
        return self.pcycleCounter1

    @Slot(int)
    def setCycleCounter2(self, val):
        self.pcycleCounter2 = val
        self.cycleCounter2_changed.emit(val)

    @Slot(result=int)
    def cycleCounter2(self):
        return self.pcycleCounter2

    @Slot(int)
    def setCycleCounter3(self, val):
        self.pcycleCounter3 = val
        self.cycleCounter3_changed.emit(val)

    @Slot(result=int)
    def cycleCounter3(self):
        return self.pcycleCounter3

    @Slot(int)
    def setCycleCounter4(self, val):
        self.pcycleCounter4 = val
        self.cycleCounter4_changed.emit(val)

    @Slot(result=int)
    def cycleCounter4(self):
        return self.pcycleCounter4

    # AlarmNumbe
    @Slot(int)
    def setAlarmNumber1(self, val):
        self.palarmNumber1 = val
        self.alarmNumber1_changed.emit(val)

    @Slot(result=int)
    def alarmNumber1(self):
        return self.palarmNumber1

    @Slot(int)
    def setAlarmNumber2(self, val):
        self.palarmNumber2 = val
        self.alarmNumber2_changed.emit(val)

    @Slot(result=int)
    def alarmNumber2(self):
        return self.palarmNumber2

    @Slot(int)
    def setAlarmNumber3(self, val):
        self.palarmNumber3 = val
        self.alarmNumber3_changed.emit(val)

    @Slot(result=int)
    def alarmNumber3(self):
        return self.palarmNumber3

    @Slot(int)
    def setAlarmNumber4(self, val):
        self.palarmNumber4 = val
        self.alarmNumber4_changed.emit(val)

    @Slot(result=int)
    def alarmNumber4(self):
        return self.palarmNumber4

    # Ready
    @Slot(bool)
    def setReady1(self, val):
        self.ready1 = val
        self.ready1_changed.emit(val)

    @Slot(result=bool)
    def ready1(self):
        return self.ready1

    @Slot(bool)
    def setReady2(self, val):
        self.ready2 = val
        self.ready2_changed.emit(val)

    @Slot(result=bool)
    def ready2(self):
        return self.ready2

    @Slot(bool)
    def setReady3(self, val):
        self.ready3 = val
        self.ready3_changed.emit(val)

    @Slot(result=bool)
    def ready3(self):
        return self.ready3

    @Slot(bool)
    def setReady4(self, val):
        self.ready4 = val
        self.ready4_changed.emit(val)

    @Slot(result=bool)
    def ready4(self):
        return self.ready4

    # Alarm
    @Slot(int)
    def setAlarm1(self, val):
        self.palarm1 = val
        self.alarm1_changed.emit(val)

    @Slot(result=int)
    def alarm1(self):
        return self.palarm1

    @Slot(int)
    def setAlarm2(self, val):
        self.palarm2 = val
        self.alarm2_changed.emit(val)

    @Slot(result=int)
    def alarm2(self):
        return self.palarm2

    @Slot(int)
    def setAlarm3(self, val):
        self.palarm3 = val
        self.alarm3_changed.emit(val)

    @Slot(result=int)
    def alarm3(self):
        return self.palarm3

    @Slot(int)
    def setAlarm4(self, val):
        self.palarm4 = val
        self.alarm4_changed.emit(val)

    @Slot(result=int)
    def alarm4(self):
        return self.palarm4

    # Sonics
    @Slot(bool)
    def setSonics1(self, val):
        self.sonics1 = val
        self.sonics1_changed.emit(val)

    @Slot(result=bool)
    def sonics1(self):
        return self.sonics1

    @Slot(bool)
    def setSonics2(self, val):
        self.sonics2 = val
        self.sonics2_changed.emit(val)

    @Slot(result=bool)
    def sonics2(self):
        return self.sonics2

    @Slot(bool)
    def setSonics3(self, val):
        self.sonics3 = val
        self.sonics3_changed.emit(val)

    @Slot(result=bool)
    def sonics3(self):
        return self.sonics3

    @Slot(bool)
    def setSonics4(self, val):
        self.sonics4 = val
        self.sonics4_changed.emit(val)

    @Slot(result=bool)
    def sonics4(self):
        return self.sonics4

    # PPM
    @Slot(int)
    def setPPM1(self, val):
        self.pppm1 = val
        self.ppm1_changed.emit(val)

    @Slot(result=int)
    def ppm1(self):
        return self.pppm1

    @Slot(int)
    def setPPM2(self, val):
        self.pppm2 = val
        self.ppm2_changed.emit(val)

    @Slot(result=int)
    def ppm2(self):
        return self.pppm2

    @Slot(int)
    def setPPM3(self, val):
        self.pppm3 = val
        self.ppm3_changed.emit(val)

    @Slot(result=int)
    def ppm3(self):
        return self.pppm3

    @Slot(int)
    def setPPM4(self, val):
        self.pppm4 = val
        self.ppm4_changed.emit(val)

    @Slot(result=int)
    def ppm4(self):
        return self.pppm4

    # CurrentTune
    @Slot(int)
    def setCurrentTune1(self, val):
        self.pcurrentTune1 = val
        self.currentTune1_changed.emit(val)

    @Slot(result=int)
    def currentTune1(self):
        return self.pcurrentTune1

    @Slot(int)
    def setCurrentTune2(self, val):
        self.pcurrentTune2 = val
        self.currentTune2_changed.emit(val)

    @Slot(result=int)
    def currentTune2(self):
        return self.pcurrentTune2

    @Slot(int)
    def setCurrentTune3(self, val):
        self.pcurrentTune3 = val
        self.currentTune3_changed.emit(val)

    @Slot(result=int)
    def currentTune3(self):
        return self.pcurrentTune3

    @Slot(int)
    def setCurrentTune4(self, val):
        self.pcurrentTune4 = val
        self.currentTune4_changed.emit(val)

    @Slot(result=int)
    def currentTune4(self):
        return self.pcurrentTune4
        
    # maxCurrentTune
    @Slot(int)
    def setmaxCurrentTune1(self, val):
        if self.pmaxCurrentTune1 == '':
            self.pmaxCurrentTune1 = val
        elif self.pmaxCurrentTune1 < val:
            self.pmaxCurrentTune1 = val
        elif self.pmaxCurrentTune1 > val:
            return
        self.maxCurrentTune1_changed.emit(val)

    @Slot(result=int)
    def maxCurrentTune1(self):
        return self.pmaxCurrentTune1

    @Slot(int)
    def setmaxCurrentTune2(self, val):
        if self.pmaxCurrentTune2 == '':
            self.pmaxCurrentTune2 = val
        elif self.pmaxCurrentTune2 < val:
            self.pmaxCurrentTune2 = val
        elif self.pmaxCurrentTune2 > val:
            return
        self.maxCurrentTune2_changed.emit(val)

    @Slot(result=int)
    def maxCurrentTune2(self):
        return self.pmaxCurrentTune2

    @Slot(int)
    def setmaxCurrentTune3(self, val):
        if self.pmaxCurrentTune3 == '':
            self.pmaxCurrentTune3 = val
        elif self.pmaxCurrentTune3 < val:
            self.pmaxCurrentTune3 = val
        elif self.pmaxCurrentTune3 > val:
            return
        self.maxCurrentTune3_changed.emit(val)

    @Slot(result=int)
    def maxCurrentTune3(self):
        return self.pmaxCurrentTune3

    @Slot(int)
    def setmaxCurrentTune4(self, val):
        if self.pmaxCurrentTune4 == '':
            self.pmaxCurrentTune4 = val
        elif self.pmaxCurrentTune4 < val:
            self.pmaxCurrentTune4 = val
        elif self.pmaxCurrentTune4 > val:
            return
        self.maxCurrentTune4_changed.emit(val)

    @Slot(result=int)
    def maxCurrentTune4(self):
        return self.pmaxCurrentTune4
        
    # minCurrentTune
    @Slot(int)
    def setminCurrentTune1(self, val):
        if self.pminCurrentTune1 == '':
            self.pminCurrentTune1 = val
        elif self.pminCurrentTune1 < val:
            return
        elif self.pminCurrentTune1 > val:
            self.pminCurrentTune1 = val
        self.minCurrentTune1_changed.emit(val)

    @Slot(result=int)
    def minCurrentTune1(self):
        return self.pminCurrentTune1

    @Slot(int)
    def setminCurrentTune2(self, val):
        if self.pminCurrentTune2 == '':
            self.pminCurrentTune2 = val
        elif self.pminCurrentTune2 < val:
            return
        elif self.pminCurrentTune2 > val:
            self.pminCurrentTune2 = val
        self.minCurrentTune2_changed.emit(val)

    @Slot(result=int)
    def minCurrentTune2(self):
        return self.pminCurrentTune2

    @Slot(int)
    def setminCurrentTune3(self, val):
        if self.pminCurrentTune3 == '':
            self.pminCurrentTune3 = val
        elif self.pminCurrentTune3 < val:
            return
        elif self.pminCurrentTune3 > val:
            self.pminCurrentTune3 = val
        self.minCurrentTune3_changed.emit(val)

    @Slot(result=int)
    def minCurrentTune3(self):
        return self.pminCurrentTune3

    @Slot(int)
    def setminCurrentTune4(self, val):
        if self.pminCurrentTune4 == '':
            self.pminCurrentTune4 = val
        elif self.pminCurrentTune4 < val:
            return
        elif self.pminCurrentTune4 > val:
            self.pminCurrentTune4 = val
        self.minCurrentTune4_changed.emit(val)

    @Slot(result=int)
    def minCurrentTune4(self):
        return self.pminCurrentTune4

    # CurrentFre
    @Slot(int)
    def setCurrentFre1(self, val):
        self.pcurrentFre1 = val
        self.currentFre1_changed.emit(val)

    @Slot(result=int)
    def currentFre1(self):
        return self.pcurrentFre1

    @Slot(int)
    def setCurrentFre2(self, val):
        self.pcurrentFre2 = val
        self.currentFre2_changed.emit(val)

    @Slot(result=int)
    def currentFre2(self):
        return self.pcurrentFre2

    @Slot(int)
    def setCurrentFre3(self, val):
        self.pcurrentFre3 = val
        self.currentFre3_changed.emit(val)

    @Slot(result=int)
    def currentFre3(self):
        return self.pcurrentFre3

    @Slot(int)
    def setCurrentFre4(self, val):
        self.pcurrentFre4 = val
        self.currentFre4_changed.emit(val)

    @Slot(result=int)
    def currentFre4(self):
        return self.pcurrentFre4
        
    # maxCurrentFre
    @Slot(int)
    def setmaxCurrentFre1(self, val):
        if self.pmaxCurrentFre1 == '':
            self.pmaxCurrentFre1 = val
        elif self.pmaxCurrentFre1 < val:
            self.pmaxCurrentFre1 = val
        elif self.pmaxCurrentFre1 > val:
            return
        self.maxCurrentFre1_changed.emit(val)

    @Slot(result=int)
    def maxCurrentFre1(self):
        return self.pmaxCurrentFre1

    @Slot(int)
    def setmaxCurrentFre2(self, val):
        if self.pmaxCurrentFre2 == '':
            self.pmaxCurrentFre2 = val
        elif self.pmaxCurrentFre2 < val:
            self.pmaxCurrentFre2 = val
        elif self.pmaxCurrentFre2 > val:
            return
        self.maxCurrentFre2_changed.emit(val)

    @Slot(result=int)
    def maxCurrentFre2(self):
        return self.pmaxCurrentFre2

    @Slot(int)
    def setmaxCurrentFre3(self, val):
        if self.pmaxCurrentFre3 == '':
            self.pmaxCurrentFre3 = val
        elif self.pmaxCurrentFre3 < val:
            self.pmaxCurrentFre3 = val
        elif self.pmaxCurrentFre3 > val:
            return
        self.maxCurrentFre3_changed.emit(val)

    @Slot(result=int)
    def maxCurrentFre3(self):
        return self.pmaxCurrentFre3

    @Slot(int)
    def setmaxCurrentFre4(self, val):
        if self.pmaxCurrentFre4 == '':
            self.pmaxCurrentFre4 = val
        elif self.pmaxCurrentFre4 < val:
            self.pmaxCurrentFre4 = val
        elif self.pmaxCurrentFre4 > val:
            return
        self.maxCurrentFre4_changed.emit(val)

    @Slot(result=int)
    def maxCurrentFre4(self):
        return self.pmaxCurrentFre4    
    
    # minminCurrentFre
    @Slot(int)
    def setminCurrentFre1(self, val):
        if self.pminCurrentFre1 == '':
            self.pminCurrentFre1 = val
        elif self.pminCurrentFre1 < val:
            return
        elif self.pminCurrentFre1 > val:
            self.pminCurrentFre1 = val
        self.minCurrentFre1_changed.emit(val)

    @Slot(result=int)
    def minCurrentFre1(self):
        return self.pminCurrentFre1

    @Slot(int)
    def setminCurrentFre2(self, val):
        if self.pminCurrentFre2 == '':
            self.pminCurrentFre2 = val
        elif self.pminCurrentFre2 < val:
            return
        elif self.pminCurrentFre2 > val:
            self.pminCurrentFre2 = val
        self.minCurrentFre2_changed.emit(val)

    @Slot(result=int)
    def minCurrentFre2(self):
        return self.pminCurrentFre2

    @Slot(int)
    def setminCurrentFre3(self, val):
        if self.pminCurrentFre3 == '':
            self.pminCurrentFre3 = val
        elif self.pminCurrentFre3 < val:
            return
        elif self.pminCurrentFre3 > val:
            self.pminCurrentFre3 = val
        self.minCurrentFre3_changed.emit(val)

    @Slot(result=int)
    def minCurrentFre3(self):
        return self.pminCurrentFre3

    @Slot(int)
    def setminCurrentFre4(self, val):
        if self.pminCurrentFre4 == '':
            self.pminCurrentFre4 = val
        elif self.pminCurrentFre4 < val:
            return
        elif self.pminCurrentFre4 > val:
            self.pminCurrentFre4 = val
        self.minCurrentFre4_changed.emit(val)

    @Slot(result=int)
    def minCurrentFre4(self):
        return self.pminCurrentFre4

    # CurrentAmp
    @Slot(int)
    def setCurrentAmp1(self, val):
        self.pcurrentAmp1 = val
        self.currentAmp1_changed.emit(val)

    @Slot(result=int)
    def currentAmp1(self):
        return self.pcurrentAmp1

    @Slot(int)
    def setCurrentAmp2(self, val):
        self.pcurrentAmp2 = val
        self.currentAmp2_changed.emit(val)

    @Slot(result=int)
    def currentAmp2(self):
        return self.pcurrentAmp2

    @Slot(int)
    def setCurrentAmp3(self, val):
        self.pcurrentAmp3 = val
        self.currentAmp3_changed.emit(val)

    @Slot(result=int)
    def currentAmp3(self):
        return self.pcurrentAmp3

    @Slot(int)
    def setCurrentAmp4(self, val):
        self.pcurrentAmp4 = val
        self.currentAmp4_changed.emit(val)

    @Slot(result=int)
    def currentAmp4(self):
        return self.pcurrentAmp4

    # minCurrentAmp
    @Slot(int)
    def setminCurrentAmp1(self, val):
        if self.pminCurrentAmp1 == '':
            self.pminCurrentAmp1 = val
        elif self.pminCurrentAmp1 < val:
            return
        elif self.pminCurrentAmp1 > val:
            self.pminCurrentAmp1 = val
        self.minCurrentAmp1_changed.emit(val)

    @Slot(result=int)
    def minCurrentAmp1(self):
        return self.pminCurrentAmp1

    @Slot(int)
    def setminCurrentAmp2(self, val):
        if self.pminCurrentAmp2 == '':
            self.pminCurrentAmp2 = val
        elif self.pminCurrentAmp2 < val:
            return
        elif self.pminCurrentAmp2 > val:
            self.pminCurrentAmp2 = val
        self.minCurrentAmp2_changed.emit(val)

    @Slot(result=int)
    def minCurrentAmp2(self):
        return self.pminCurrentAmp2

    @Slot(int)
    def setminCurrentAmp3(self, val):
        if self.pminCurrentAmp3 == '':
            self.pminCurrentAmp3 = val
        elif self.pminCurrentAmp3 < val:
            return
        elif self.pminCurrentAmp3 > val:
            self.pminCurrentAmp3 = val
        self.minCurrentAmp3_changed.emit(val)

    @Slot(result=int)
    def minCurrentAmp3(self):
        return self.pminCurrentAmp3

    @Slot(int)
    def setminCurrentAmp4(self, val):
        if self.pminCurrentAmp4 == '':
            self.pminCurrentAmp4 = val
        elif self.pminCurrentAmp4 < val:
            return
        elif self.pminCurrentAmp4 > val:
            self.pminCurrentAmp4 = val
        self.minCurrentAmp4_changed.emit(val)

    @Slot(result=int)
    def minCurrentAmp4(self):
        return self.pminCurrentAmp4
        
        
        
    # maxCurrentAmp
    @Slot(int)
    def setmaxCurrentAmp1(self, val):
        if self.pmaxCurrentAmp1 == '':
            self.pmaxCurrentAmp1 = val
        elif self.pmaxCurrentAmp1 < val:
            self.pmaxCurrentAmp1 = val
        elif self.pmaxCurrentAmp1 > val:
            return
        self.maxCurrentAmp1_changed.emit(val)

    @Slot(result=int)
    def maxCurrentAmp1(self):
        return self.pmaxCurrentAmp1

    @Slot(int)
    def setmaxCurrentAmp2(self, val):
        if self.pmaxCurrentAmp2 == '':
            self.pmaxCurrentAmp2 = val
        elif self.pmaxCurrentAmp2 < val:
            self.pmaxCurrentAmp2 = val
        elif self.pmaxCurrentAmp2 > val:
            return
        self.maxCurrentAmp2_changed.emit(val)

    @Slot(result=int)
    def maxCurrentAmp2(self):
        return self.pmaxCurrentAmp2

    @Slot(int)
    def setmaxCurrentAmp3(self, val):
        if self.pmaxCurrentAmp3 == '':
            self.pmaxCurrentAmp3 = val
        elif self.pmaxCurrentAmp3 < val:
            self.pmaxCurrentAmp3 = val
        elif self.pmaxCurrentAmp3 > val:
            return
        self.maxCurrentAmp3_changed.emit(val)

    @Slot(result=int)
    def maxCurrentAmp3(self):
        return self.pmaxCurrentAmp3

    @Slot(int)
    def setmaxCurrentAmp4(self, val):
        if self.pmaxCurrentAmp4 == '':
            self.pmaxCurrentAmp4 = val
        elif self.pmaxCurrentAmp4 < val:
            self.pmaxCurrentAmp4 = val
        elif self.pmaxCurrentAmp4 > val:
            return
        self.maxCurrentAmp4_changed.emit(val)

    @Slot(result=int)
    def maxCurrentAmp4(self):
        return self.pmaxCurrentAmp4

    # CurrentPower
    @Slot(int)
    def setCurrentPower1(self, val):
        self.pcurrentPower1 = val
        self.currentPower1_changed.emit(val)

    @Slot(result=int)
    def currentPower1(self):
        return self.pcurrentPower1

    @Slot(int)
    def setCurrentPower2(self, val):
        self.pcurrentPower2 = val
        self.currentPower2_changed.emit(val)

    @Slot(result=int)
    def currentPower2(self):
        return self.pcurrentPower2

    @Slot(int)
    def setCurrentPower3(self, val):
        self.pcurrentPower3 = val
        self.currentPower3_changed.emit(val)

    @Slot(result=int)
    def currentPower3(self):
        return self.pcurrentPower3

    @Slot(int)
    def setCurrentPower4(self, val):
        self.pcurrentPower4 = val
        self.currentPower4_changed.emit(val)

    @Slot(result=int)
    def currentPower4(self):
        return self.pcurrentPower4

    # minCurrentPower
    @Slot(int)
    def setminCurrentPower1(self, val):
        if self.pminCurrentPower1 == '':
            self.pminCurrentPower1 = val
        elif self.pminCurrentPower1 < val:
            return
        elif self.pminCurrentPower1 > val:
            self.pminCurrentPower1 = val
        self.minCurrentPower1_changed.emit(val)

    @Slot(result=int)
    def minCurrentPower1(self):
        return self.pminCurrentPower1

    @Slot(int)
    def setminCurrentPower2(self, val):
        if self.pminCurrentPower2 == '':
            self.pminCurrentPower2 = val
        elif self.pminCurrentPower2 < val:
            return
        elif self.pminCurrentPower2 > val:
            self.pminCurrentPower2 = val
        self.minCurrentPower2_changed.emit(val)

    @Slot(result=int)
    def minCurrentPower2(self):
        return self.pminCurrentPower2

    @Slot(int)
    def setminCurrentPower3(self, val):
        if self.pminCurrentPower3 == '':
            self.pminCurrentPower3 = val
        elif self.pminCurrentPower3 < val:
            return
        elif self.pminCurrentPower3 > val:
            self.pminCurrentPower3 = val
        self.minCurrentPower3_changed.emit(val)

    @Slot(result=int)
    def minCurrentPower3(self):
        return self.pminCurrentPower3

    @Slot(int)
    def setminCurrentPower4(self, val):
        if self.pminCurrentPower4 == '':
            self.pminCurrentPower4 = val
        elif self.pminCurrentPower4 < val:
            return
        elif self.pminCurrentPower4 > val:
            self.pminCurrentPower4 = val
        self.minCurrentPower4_changed.emit(val)

    @Slot(result=int)
    def minCurrentPower4(self):
        return self.pminCurrentPower4

    # maxCurrentPower
    @Slot(int)
    def setmaxCurrentPower1(self, val):
        if self.pmaxCurrentPower1 == '':
            self.pmaxCurrentPower1 = val
        elif self.pmaxCurrentPower1 < val:
            self.pmaxCurrentPower1 = val
        elif self.pmaxCurrentPower1 > val:
            return
        self.maxCurrentPower1_changed.emit(val)


    @Slot(result=int)
    def maxCurrentPower1(self):
        return self.pmaxCurrentPower1

    @Slot(int)
    def setmaxCurrentPower2(self, val):
        if self.pmaxCurrentPower2 == '':
            self.pmaxCurrentPower2 = val
        elif self.pmaxCurrentPower2 < val:
            self.pmaxCurrentPower2 = val
        elif self.pmaxCurrentPower2 > val:
            return
        self.maxCurrentPower2_changed.emit(val)

    @Slot(result=int)
    def maxCurrentPower2(self):
        return self.pmaxCurrentPower2

    @Slot(int)
    def setmaxCurrentPower3(self, val):
        if self.pmaxCurrentPower3 == '':
            self.pmaxCurrentPower3 = val
        elif self.pmaxCurrentPower3 < val:
            self.pmaxCurrentPower3 = val
        elif self.pmaxCurrentPower3 > val:
            return
        self.maxCurrentPower3_changed.emit(val)

    @Slot(result=int)
    def maxCurrentPower3(self):
        return self.pmaxCurrentPower3

    @Slot(int)
    def setmaxCurrentPower4(self, val):
        if self.pmaxCurrentPower4 == '':
            self.pmaxCurrentPower4 = val
        elif self.pmaxCurrentPower4 < val:
            self.pmaxCurrentPower4 = val
        elif self.pmaxCurrentPower4 > val:
            return
        self.maxCurrentPower4_changed.emit(val)

    @Slot(result=int)
    def maxCurrentPower4(self):
        return self.pmaxCurrentPower4
        
        

    # PowerArry
    # PowerLength
    @Slot(int)
    def setPowerLength1(self, val):
        self.powerLength1 = val
        self.powerLength1_changed.emit(val)

    @Slot(result=int)
    def powerLength1(self):
        return self.powerLength1

    @Slot(int)
    def setPowerLength2(self, val):
        self.powerLength2 = val
        self.powerLength2_changed.emit(val)

    @Slot(result=int)
    def powerLength2(self):
        return self.powerLength2

    @Slot(int)
    def setPowerLength3(self, val):
        self.powerLength3 = val
        self.powerLength3_changed.emit(val)

    @Slot(result=int)
    def powerLength3(self):
        return self.powerLength3

    @Slot(int)
    def setPowerLength4(self, val):
        self.powerLength4 = val
        self.powerLength4_changed.emit(val)

    @Slot(result=int)
    def powerLength4(self):
        return self.powerLength4

    mStart1 = Property(bool, start1, setStart1, notify=start1_changed)
    mStart2 = Property(bool, start2, setStart2, notify=start2_changed)
    mStart3 = Property(bool, start3, setStart3, notify=start3_changed)
    mStart4 = Property(bool, start4, setStart4, notify=start4_changed)

    mReset1 = Property(bool, reSet1, setReset1, notify=reSet1_changed)
    mReset2 = Property(bool, reSet2, setReset2, notify=reSet2_changed)
    mReset3 = Property(bool, reSet3, setReset3, notify=reSet3_changed)
    mReset4 = Property(bool, reSet4, setReset4, notify=reSet4_changed)

    mMode1 = Property(int, mode1, setMode1, notify=mode1_changed)
    mMode2 = Property(int, mode2, setMode2, notify=mode2_changed)
    mMode3 = Property(int, mode3, setMode3, notify=mode3_changed)
    mMode4 = Property(int, mode4, setMode4, notify=mode4_changed)

    mDataReady1 = Property(bool, dataReady1, setDataready1, notify=dataReady1_changed)
    mDataReady2 = Property(bool, dataReady2, setDataready2, notify=dataReady2_changed)
    mDataReady3 = Property(bool, dataReady3, setDataready3, notify=dataReady3_changed)
    mDataReady4 = Property(bool, dataReady4, setDataready4, notify=dataReady4_changed)

    mAlarmlock1 = Property(bool, alarmLock1, setAlarmlock1, notify=alarmLock1_changed)
    mAlarmlock2 = Property(bool, alarmLock2, setAlarmlock2, notify=alarmLock2_changed)
    mAlarmlock3 = Property(bool, alarmLock3, setAlarmlock3, notify=alarmLock3_changed)
    mAlarmlock4 = Property(bool, alarmLock4, setAlarmlock4, notify=alarmLock4_changed)

    mEstop1 = Property(bool, estop1, setEstop1, notify=estop1_changed)
    mEstop2 = Property(bool, estop2, setEstop2, notify=estop2_changed)
    mEstop3 = Property(bool, estop3, setEstop3, notify=estop3_changed)
    mEstop4 = Property(bool, estop4, setEstop4, notify=estop4_changed)

    mCycleCounter1 = Property(int, cycleCounter1, setCycleCounter1, notify=cycleCounter1_changed)
    mCycleCounter2 = Property(int, cycleCounter2, setCycleCounter2, notify=cycleCounter2_changed)
    mCycleCounter3 = Property(int, cycleCounter3, setCycleCounter3, notify=cycleCounter3_changed)
    mCycleCounter4 = Property(int, cycleCounter4, setCycleCounter4, notify=cycleCounter4_changed)

    mAlarmNumber1 = Property(int, alarmNumber1, setAlarmNumber1, notify=alarmNumber1_changed)
    mAlarmNumber2 = Property(int, alarmNumber2, setAlarmNumber2, notify=alarmNumber2_changed)
    mAlarmNumber3 = Property(int, alarmNumber3, setAlarmNumber3, notify=alarmNumber3_changed)
    mAlarmNumber4 = Property(int, alarmNumber4, setAlarmNumber4, notify=alarmNumber4_changed)

    mReady1 = Property(bool, ready1, setReady1, notify=ready1_changed)
    mReady2 = Property(bool, ready2, setReady2, notify=ready2_changed)
    mReady3 = Property(bool, ready3, setReady3, notify=ready3_changed)
    mReady4 = Property(bool, ready4, setReady4, notify=ready4_changed)

    mAlarm1 = Property(int, alarm1, setAlarm1, notify=alarm1_changed)
    mAlarm2 = Property(int, alarm2, setAlarm2, notify=alarm2_changed)
    mAlarm3 = Property(int, alarm3, setAlarm3, notify=alarm3_changed)
    mAlarm4 = Property(int, alarm4, setAlarm4, notify=alarm4_changed)

    mBatchSize1 = Property(int, batchSize1, setBatchSize1, notify=batchSize1_changed)
    mBatchSize2 = Property(int, batchSize2, setBatchSize2, notify=batchSize2_changed)
    mBatchSize3 = Property(int, batchSize3, setBatchSize3, notify=batchSize3_changed)
    mBatchSize4 = Property(int, batchSize4, setBatchSize4, notify=batchSize4_changed)

    mSonics1 = Property(bool, sonics1, setSonics1, notify=sonics1_changed)
    mSonics2 = Property(bool, sonics2, setSonics2, notify=sonics2_changed)
    mSonics3 = Property(bool, sonics3, setSonics3, notify=sonics3_changed)
    mSonics4 = Property(bool, sonics4, setSonics4, notify=sonics4_changed)

    mPPM1 = Property(int, ppm1, setPPM1, notify=ppm1_changed)
    mPPM2 = Property(int, ppm2, setPPM2, notify=ppm2_changed)
    mPPM3 = Property(int, ppm3, setPPM3, notify=ppm3_changed)
    mPPM4 = Property(int, ppm4, setPPM4, notify=ppm4_changed)

    mCurrentTune1 = Property(int, currentTune1, setCurrentTune1, notify=currentTune1_changed)
    mCurrentTune2 = Property(int, currentTune2, setCurrentTune2, notify=currentTune2_changed)
    mCurrentTune3 = Property(int, currentTune3, setCurrentTune3, notify=currentTune3_changed)
    mCurrentTune4 = Property(int, currentTune4, setCurrentTune4, notify=currentTune4_changed)
    mminCurrentTune1 = Property(int, minCurrentTune1, setminCurrentTune1, notify=minCurrentTune1_changed)
    mminCurrentTune2 = Property(int, minCurrentTune2, setminCurrentTune2, notify=minCurrentTune2_changed)
    mminCurrentTune3 = Property(int, minCurrentTune3, setminCurrentTune3, notify=minCurrentTune3_changed)
    mminCurrentTune4 = Property(int, minCurrentTune4, setminCurrentTune4, notify=minCurrentTune4_changed)
    mmaxCurrentTune1 = Property(int, maxCurrentTune1, setmaxCurrentTune1, notify=maxCurrentTune1_changed)
    mmaxCurrentTune2 = Property(int, maxCurrentTune2, setmaxCurrentTune2, notify=maxCurrentTune2_changed)
    mmaxCurrentTune3 = Property(int, maxCurrentTune3, setmaxCurrentTune3, notify=maxCurrentTune3_changed)
    mmaxCurrentTune4 = Property(int, maxCurrentTune4, setmaxCurrentTune4, notify=maxCurrentTune4_changed)

    mCurrentFre1 = Property(int, currentFre1, setCurrentFre1, notify=currentFre1_changed)
    mCurrentFre2 = Property(int, currentFre2, setCurrentFre2, notify=currentFre2_changed)
    mCurrentFre3 = Property(int, currentFre3, setCurrentFre3, notify=currentFre3_changed)
    mCurrentFre4 = Property(int, currentFre4, setCurrentFre4, notify=currentFre4_changed)
    mminCurrentFre1 = Property(int, minCurrentFre1, setminCurrentFre1, notify=minCurrentFre1_changed)
    mminCurrentFre2 = Property(int, minCurrentFre2, setminCurrentFre2, notify=minCurrentFre2_changed)
    mminCurrentFre3 = Property(int, minCurrentFre3, setminCurrentFre3, notify=minCurrentFre3_changed)
    mminCurrentFre4 = Property(int, minCurrentFre4, setminCurrentFre4, notify=minCurrentFre4_changed)
    mmaxCurrentFre1 = Property(int, maxCurrentFre1, setmaxCurrentFre1, notify=maxCurrentFre1_changed)
    mmaxCurrentFre2 = Property(int, maxCurrentFre2, setmaxCurrentFre2, notify=maxCurrentFre2_changed)
    mmaxCurrentFre3 = Property(int, maxCurrentFre3, setmaxCurrentFre3, notify=maxCurrentFre3_changed)
    mmaxCurrentFre4 = Property(int, maxCurrentFre4, setmaxCurrentFre4, notify=maxCurrentFre4_changed)

    mCurrentAmp1 = Property(int, currentAmp1, setCurrentAmp1, notify=currentAmp1_changed)
    mCurrentAmp2 = Property(int, currentAmp2, setCurrentAmp2, notify=currentAmp2_changed)
    mCurrentAmp3 = Property(int, currentAmp3, setCurrentAmp3, notify=currentAmp3_changed)
    mCurrentAmp4 = Property(int, currentAmp4, setCurrentAmp4, notify=currentAmp4_changed)
    mminCurrentAmp1 = Property(int, minCurrentAmp1, setminCurrentAmp1, notify=minCurrentAmp1_changed)
    mminCurrentAmp2 = Property(int, minCurrentAmp2, setminCurrentAmp2, notify=minCurrentAmp2_changed)
    mminCurrentAmp3 = Property(int, minCurrentAmp3, setminCurrentAmp3, notify=minCurrentAmp3_changed)
    mminCurrentAmp4 = Property(int, minCurrentAmp4, setminCurrentAmp4, notify=minCurrentAmp4_changed)
    mmaxCurrentAmp1 = Property(int, maxCurrentAmp1, setmaxCurrentAmp1, notify=maxCurrentAmp1_changed)
    mmaxCurrentAmp2 = Property(int, maxCurrentAmp2, setmaxCurrentAmp2, notify=maxCurrentAmp2_changed)
    mmaxCurrentAmp3 = Property(int, maxCurrentAmp3, setmaxCurrentAmp3, notify=maxCurrentAmp3_changed)
    mmaxCurrentAmp4 = Property(int, maxCurrentAmp4, setmaxCurrentAmp4, notify=maxCurrentAmp4_changed)

    mCurrentPower1 = Property(int, currentPower1, setCurrentPower1, notify=currentPower1_changed)
    mCurrentPower2 = Property(int, currentPower2, setCurrentPower2, notify=currentPower2_changed)
    mCurrentPower3 = Property(int, currentPower3, setCurrentPower3, notify=currentPower3_changed)
    mCurrentPower4 = Property(int, currentPower4, setCurrentPower4, notify=currentPower4_changed)
    mminCurrentPower1 = Property(int, minCurrentPower1, setminCurrentPower1, notify=minCurrentPower1_changed)
    mminCurrentPower2 = Property(int, minCurrentPower2, setminCurrentPower2, notify=minCurrentPower2_changed)
    mminCurrentPower3 = Property(int, minCurrentPower3, setminCurrentPower3, notify=minCurrentPower3_changed)
    mminCurrentPower4 = Property(int, minCurrentPower4, setminCurrentPower4, notify=minCurrentPower4_changed)
    mmaxCurrentPower1 = Property(int, maxCurrentPower1, setmaxCurrentPower1, notify=maxCurrentPower1_changed)
    mmaxCurrentPower2 = Property(int, maxCurrentPower2, setmaxCurrentPower2, notify=maxCurrentPower2_changed)
    mmaxCurrentPower3 = Property(int, maxCurrentPower3, setmaxCurrentPower3, notify=maxCurrentPower3_changed)
    mmaxCurrentPower4 = Property(int, maxCurrentPower4, setmaxCurrentPower4, notify=maxCurrentPower4_changed)
    # mPowerArray1 = Property(bool, powerArray1, setPowerArray1, notify=powerArray1_changed)
    # mPowerArray2 = Property(bool, powerArray2, setPowerArray2, notify=powerArray2_changed)
    # mPowerArray3 = Property(bool, powerArray3, setPowerArray3, notify=powerArray3_changed)
    # mPowerArray4 = Property(bool, powerArray4, setPowerArray4, notify=powerArray4_changed)

    mPowerLength1 = Property(int, powerLength1, setPowerLength1, notify=powerLength1_changed)
    mPowerLength2 = Property(int, powerLength2, setPowerLength2, notify=powerLength2_changed)
    mPowerLength3 = Property(int, powerLength3, setPowerLength3, notify=powerLength3_changed)
    mPowerLength4 = Property(int, powerLength4, setPowerLength4, notify=powerLength4_changed)

    @Slot()
    def resetData(self):
        self.pmaxCurrentTune1 = ''
        self.pmaxCurrentTune2 = ''
        self.pmaxCurrentTune3 = ''
        self.pmaxCurrentTune4 = ''
        self.pminCurrentTune1 = ''
        self.pminCurrentTune2 = ''
        self.pminCurrentTune3 = ''
        self.pminCurrentTune4 = ''
        self.pmaxCurrentAmp1 = ''
        self.pmaxCurrentAmp2 = ''
        self.pmaxCurrentAmp3 = ''
        self.pmaxCurrentAmp4 = ''
        self.pminCurrentAmp1 = ''
        self.pminCurrentAmp2 = ''
        self.pminCurrentAmp3 = ''
        self.pminCurrentAmp4 = ''
        self.pmaxCurrentFre1 = ''
        self.pmaxCurrentFre2 = ''
        self.pmaxCurrentFre3 = ''
        self.pmaxCurrentFre4 = ''
        self.pminCurrentFre1 = ''
        self.pminCurrentFre2 = ''
        self.pminCurrentFre3 = ''
        self.pminCurrentFre4 = ''
        self.pmaxCurrentPower1 = ''
        self.pmaxCurrentPower2 = ''
        self.pmaxCurrentPower3 = ''
        self.pmaxCurrentPower4 = ''
        self.pminCurrentPower1 = ''
        self.pminCurrentPower2 = ''
        self.pminCurrentPower3 = ''
        self.pminCurrentPower4 = ''

    """
    called for every datachange notification from server
    """

    def datachange_notification(self, node, val, data):
        if node == self.M_Start:
            self.setStart1(val)
        elif node == self.M_Reset:
            self.setReset1(val)
        elif node == self.M_Mode:
            self.setMode1(val)
        elif node == self.M_DataReady:
            self.setDataready1(val)
        elif node == self.M_AlarmLock:
            self.setAlarmlock1(val)
        elif node == self.E_STOP:
            self.setEstop1(val)
        elif node == self.M_BatchSize:
            self.setBatchSize1(val)
        elif node == self.M_CycleCounter:
            self.setCycleCounter1(val)
        elif node == self.M_AlarmNumber:
            self.setAlarmNumber1(val)
        elif node == self.M_Ready:
            self.setReady1(val)
        elif node == self.M_Alarm:
            self.setAlarm1(val)
        elif node == self.M_Sonics:
            self.setSonics1(val)
        elif node == self.M_PPM:
            self.setPPM1(val)
        elif node == self.M_CurrentTune:
            self.setCurrentTune1(val)
            self.setmaxCurrentTune1(val)
            self.setminCurrentTune1(val)
        elif node == self.M_CurrentFre_offset:
            self.setCurrentFre1(val)
            self.setmaxCurrentFre1(val)
            self.setminCurrentFre1(val)
        elif node == self.M_CurrentAmplitude:
            self.setCurrentAmp1(val)
            self.setmaxCurrentAmp1(val)
            self.setminCurrentAmp1(val)
        elif node == self.M_CurrentPower:
            self.setCurrentPower1(val)
            self.setmaxCurrentPower1(val)
            self.setminCurrentPower1(val)
        elif node == self.M_PowerLength:
            self.setPowerLength1(val)
        elif node == self.M_Start2:
            self.setStart2(val)
        elif node == self.M_Reset2:
            self.setReset2(val)
        elif node == self.M_Mode2:
            self.setMode2(val)
        elif node == self.M_DataReady2:
            self.setDataready2(val)
        elif node == self.M_AlarmLock2:
            self.setAlarmlock2(val)
        elif node == self.E_STOP2:
            self.setEstop2(val)
        elif node == self.M_BatchSize2:
            self.setBatchSize2(val)
        elif node == self.M_CycleCounter2:
            self.setCycleCounter2(val)
        elif node == self.M_AlarmNumber2:
            self.setAlarmNumber2(val)
        elif node == self.M_Ready2:
            self.setReady2(val)
        elif node == self.M_Alarm2:
            self.setAlarm2(val)
        elif node == self.M_Sonics2:
            self.setSonics2(val)
        elif node == self.M_PPM2:
            self.setPPM2(val)
        elif node == self.M_CurrentTune2:
            self.setCurrentTune2(val)
            self.setmaxCurrentTune2(val)
            self.setminCurrentTune2(val)
        elif node == self.M_CurrentFre_offset2:
            self.setCurrentFre2(val)
            self.setmaxCurrentFre2(val)
            self.setminCurrentFre2(val)
        elif node == self.M_CurrentAmplitude2:
            self.setCurrentAmp2(val)
            self.setmaxCurrentAmp2(val)
            self.setminCurrentAmp2(val)
        elif node == self.M_CurrentPower2:
            self.setCurrentPower2(val)
            self.setmaxCurrentPower2(val)
            self.setminCurrentPower2(val)
        elif node == self.M_PowerLength2:
            self.setPowerLength2(val)
        elif node == self.M_Start3:
            self.setStart3(val)
        elif node == self.M_Reset3:
            self.setReset3(val)
        elif node == self.M_Mode3:
            self.setMode3(val)
        elif node == self.M_DataReady3:
            self.setDataready3(val)
        elif node == self.M_AlarmLock3:
            self.setAlarmlock3(val)
        elif node == self.E_STOP3:
            self.setEstop3(val)
        elif node == self.M_BatchSize3:
            self.setBatchSize3(val)
        elif node == self.M_CycleCounter3:
            self.setCycleCounter3(val)
        elif node == self.M_AlarmNumber3:
            self.setAlarmNumber3(val)
        elif node == self.M_Ready3:
            self.setReady3(val)
        elif node == self.M_Alarm3:
            self.setAlarm3(val)
        elif node == self.M_Sonics3:
            self.setSonics3(val)
        elif node == self.M_PPM3:
            self.setPPM3(val)
        elif node == self.M_CurrentTune3:
            self.setCurrentTune3(val)
            self.setmaxCurrentTune3(val)
            self.setminCurrentTune3(val)
        elif node == self.M_CurrentFre_offset3:
            self.setCurrentFre3(val)
            self.setmaxCurrentFre3(val)
            self.setminCurrentFre3(val)
        elif node == self.M_CurrentAmplitude3:
            self.setCurrentAmp3(val)
            self.setmaxCurrentAmp3(val)
            self.setminCurrentAmp3(val)
        elif node == self.M_CurrentPower3:
            self.setCurrentPower3(val)
            self.setmaxCurrentPower3(val)
            self.setminCurrentPower3(val)
        elif node == self.M_PowerLength3:
            self.setPowerLength3(val)
        elif node == self.M_Start4:
            self.setStart4(val)
        elif node == self.M_Reset4:
            self.setReset4(val)
        elif node == self.M_Mode4:
            self.setMode4(val)
        elif node == self.M_DataReady4:
            self.setDataready4(val)
        elif node == self.M_AlarmLock4:
            self.setAlarmlock4(val)
        elif node == self.E_STOP4:
            self.setEstop4(val)
        elif node == self.M_BatchSize4:
            self.setBatchSize4(val)
        elif node == self.M_CycleCounter4:
            self.setCycleCounter4(val)
        elif node == self.M_AlarmNumber4:
            self.setAlarmNumber4(val)
        elif node == self.M_Ready4:
            self.setReady4(val)
        elif node == self.M_Alarm4:
            self.setAlarm4(val)
        elif node == self.M_Sonics4:
            self.setSonics4(val)
        elif node == self.M_PPM4:
            self.setPPM4(val)
        elif node == self.M_CurrentTune4:
            self.setCurrentTune4(val)
            self.setmaxCurrentTune4(val)
            self.setminCurrentTune4(val)
        elif node == self.M_CurrentFre_offset4:
            self.setCurrentFre4(val)
            self.setmaxCurrentFre4(val)
            self.setminCurrentFre4(val)
        elif node == self.M_CurrentAmplitude4:
            self.setCurrentAmp4(val)
            self.setmaxCurrentAmp4(val)
            self.setminCurrentAmp4(val)
        elif node == self.M_CurrentPower4:
            self.setCurrentPower4(val)
            self.setmaxCurrentPower4(val)
            self.setminCurrentPower4(val)
        elif node == self.M_PowerLength4:
            self.setPowerLength4(val)
