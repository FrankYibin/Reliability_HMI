from opcua import Client
from datetime import datetime

# Assign endpoint URL

# Temperature_node.set_writable()
# Temperature_node1.set_writable()
from PySide2.QtCore import QObject, Qt, Signal, Slot, QUrl, QStringListModel, QCoreApplication, Property


class opcClient(QObject):
    def __init__(self):
        QObject.__init__(self)

        url = "192.168.0.10"
        port = 4840
        endpoint = "opc.tcp://{}:{}".format(url, port)
        # Assign endpoint url on the OPC UA client  address space
        self.myclient = Client(endpoint,1)
        try:
            self.myclient.connect()
        except:
            print("opc连接失败")
        else:
            self.subscribe = self.myclient.create_subscription(0, self)
            self.subNodesId()

        # Connect to server
        self.M_Start = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Start"')
        self.M_Reset = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Reset"')
        self.M_Mode = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Mode"')
        self.M_DataReady = self.myclient.get_node('ns=3;s="OPCUA"."1#M_DataReady"')
        self.M_AlarmLock = self.myclient.get_node('ns=3;s="OPCUA"."1#M_AlarmLock"')
        self.E_STOP = self.myclient.get_node('ns=3;s="OPCUA"."1#E_STOP"')
        self.M_BatchSize = self.myclient.get_node('ns=3;s="OPCUA"."1#M_BatchSize"')
        self.M_CycleCounter = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CycleCounter"')
        self.M_AlarmNumber = self.myclient.get_node('ns=3;s="OPCUA"."1#M_AlarmNumber"')
        self.M_Ready = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Ready"')
        self.M_Alarm = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Alarm"')
        self.M_Sonics = self.myclient.get_node('ns=3;s="OPCUA"."1#M_Sonics"')
        self.M_PPM = self.myclient.get_node('ns=3;s="OPCUA"."1#M_PPM"')
        self.M_CurrentTune = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentTune"')
        self.M_CurrentFre_offset = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentFre_offset"')
        self.M_CurrentAmplitude = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentAmplitude"')
        self.M_CurrentPower = self.myclient.get_node('ns=3;s="OPCUA"."1#M_CurrentPower"')
        self.M_PowerArray = self.myclient.get_node('ns=3;s="OPCUA"."1#M_PowerArray"')
        self.M_PowerLength = self.myclient.get_node('ns=3;s="OPCUA"."1#M_PowerLength"')
        self.M_Start2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Start"')
        self.M_Reset2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Reset"')
        self.M_Mode2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Mode"')
        self.M_DataReady2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_DataReady"')
        self.M_AlarmLock2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_AlarmLock"')
        self.E_STOP2 = self.myclient.get_node('ns=3;s="OPCUA"."2#E_STOP"')
        self.M_BatchSize2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_BatchSize"')
        self.M_CycleCounter2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CycleCounter"')
        self.M_AlarmNumber2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_AlarmNumber"')
        self.M_Ready2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Ready"')
        self.M_Alarm2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Alarm"')
        self.M_Sonics2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_Sonics"')
        self.M_PPM2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_PPM"')
        self.M_CurrentTune2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentTune"')
        self.M_CurrentFre_offset2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentFre_offset"')
        self.M_CurrentAmplitude2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentAmplitude"')
        self.M_CurrentPower2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_CurrentPower"')
        self.M_PowerArray2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_PowerArray"')
        self.M_PowerLength2 = self.myclient.get_node('ns=3;s="OPCUA"."2#M_PowerLength"')
        self.M_Start3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Start"')
        self.M_Reset3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Reset"')
        self.M_Mode3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Mode"')
        self.M_DataReady3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_DataReady"')
        self.M_AlarmLock3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_AlarmLock"')
        self.E_STOP3 = self.myclient.get_node('ns=3;s="OPCUA"."3#E_STOP"')
        self.M_BatchSize3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_BatchSize"')
        self.M_CycleCounter3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CycleCounter"')
        self.M_AlarmNumber3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_AlarmNumber"')
        self.M_Ready3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Ready"')
        self.M_Alarm3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Alarm"')
        self.M_Sonics3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_Sonics"')
        self.M_PPM3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_PPM"')
        self.M_CurrentTune3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentTune"')
        self.M_CurrentFre_offset3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentFre_offset"')
        self.M_CurrentAmplitude3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentAmplitude"')
        self.M_CurrentPower3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_CurrentPower"')
        self.M_PowerArray3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_PowerArray"')
        self.M_PowerLength3 = self.myclient.get_node('ns=3;s="OPCUA"."3#M_PowerLength"')
        self.M_Start4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Start"')
        self.M_Reset4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Reset"')
        self.M_Mode4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Mode"')
        self.M_DataReady4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_DataReady"')
        self.M_AlarmLock4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_AlarmLock"')
        self.E_STOP4 = self.myclient.get_node('ns=3;s="OPCUA"."4#E_STOP"')
        self.M_BatchSize4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_BatchSize"')
        self.M_CycleCounter4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CycleCounter"')
        self.M_AlarmNumber4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_AlarmNumber"')
        self.M_Ready4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Ready"')
        self.M_Alarm4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Alarm"')
        self.M_Sonics4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_Sonics"')
        self.M_PPM4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_PPM"')
        self.M_CurrentTune4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentTune"')
        self.M_CurrentFre_offset4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentFre_offset"')
        self.M_CurrentAmplitude4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentAmplitude"')
        self.M_CurrentPower4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_CurrentPower"')
        self.M_PowerArray4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_PowerArray"')
        self.M_PowerLength4 = self.myclient.get_node('ns=3;s="OPCUA"."4#M_PowerLength"')

    def subNodesId(self):
        # create subscription by passing period in milliseconds and handler
        self.subscribe.subscribe_data_change(self.M_Start)
        self.subscribe.subscribe_data_change(self.M_Reset)
        self.subscribe.subscribe_data_change(self.M_Mode)
        self.subscribe.subscribe_data_change(self.M_DataReady)
        self.subscribe.subscribe_data_change(self.M_AlarmLock)
        self.subscribe.subscribe_data_change(self.E_STOP)
        self.subscribe.subscribe_data_change(self.M_BatchSize)
        self.subscribe.subscribe_data_change(self.M_CycleCounter)
        self.subscribe.subscribe_data_change(self.M_AlarmNumber)
        self.subscribe.subscribe_data_change(self.M_Ready)
        self.subscribe.subscribe_data_change(self.M_Alarm)
        self.subscribe.subscribe_data_change(self.M_Sonics)
        self.subscribe.subscribe_data_change(self.M_PPM)
        self.subscribe.subscribe_data_change(self.M_CurrentTune)
        self.subscribe.subscribe_data_change(self.M_CurrentFre_offset)
        self.subscribe.subscribe_data_change(self.M_CurrentAmplitude)
        self.subscribe.subscribe_data_change(self.M_CurrentPower)
        self.subscribe.subscribe_data_change(self.M_PowerArray)
        self.subscribe.subscribe_data_change(self.M_PowerLength)
        self.subscribe.subscribe_data_change(self.M_Start2)
        self.subscribe.subscribe_data_change(self.M_Reset2)
        self.subscribe.subscribe_data_change(self.M_Mode2)
        self.subscribe.subscribe_data_change(self.M_DataReady2)
        self.subscribe.subscribe_data_change(self.M_AlarmLock2)
        self.subscribe.subscribe_data_change(self.E_STOP2)
        self.subscribe.subscribe_data_change(self.M_BatchSize2)
        self.subscribe.subscribe_data_change(self.M_CycleCounter2)
        self.subscribe.subscribe_data_change(self.M_AlarmNumber2)
        self.subscribe.subscribe_data_change(self.M_Ready2)
        self.subscribe.subscribe_data_change(self.M_Alarm2)
        self.subscribe.subscribe_data_change(self.M_Sonics2)
        self.subscribe.subscribe_data_change(self.M_PPM2)
        self.subscribe.subscribe_data_change(self.M_CurrentTune2)
        self.subscribe.subscribe_data_change(self.M_CurrentFre_offset2)
        self.subscribe.subscribe_data_change(self.M_CurrentAmplitude2)
        self.subscribe.subscribe_data_change(self.M_CurrentPower2)
        self.subscribe.subscribe_data_change(self.M_PowerArray2)
        self.subscribe.subscribe_data_change(self.M_PowerLength2)
        self.subscribe.subscribe_data_change(self.M_Start3)
        self.subscribe.subscribe_data_change(self.M_Reset3)
        self.subscribe.subscribe_data_change(self.M_Mode3)
        self.subscribe.subscribe_data_change(self.M_DataReady3)
        self.subscribe.subscribe_data_change(self.M_AlarmLock3)
        self.subscribe.subscribe_data_change(self.E_STOP3)
        self.subscribe.subscribe_data_change(self.M_BatchSize3)
        self.subscribe.subscribe_data_change(self.M_CycleCounter3)
        self.subscribe.subscribe_data_change(self.M_AlarmNumber3)
        self.subscribe.subscribe_data_change(self.M_Ready3)
        self.subscribe.subscribe_data_change(self.M_Alarm3)
        self.subscribe.subscribe_data_change(self.M_Sonics3)
        self.subscribe.subscribe_data_change(self.M_PPM3)
        self.subscribe.subscribe_data_change(self.M_CurrentTune3)
        self.subscribe.subscribe_data_change(self.M_CurrentFre_offset3)
        self.subscribe.subscribe_data_change(self.M_CurrentAmplitude3)
        self.subscribe.subscribe_data_change(self.M_CurrentPower3)
        self.subscribe.subscribe_data_change(self.M_PowerArray3)
        self.subscribe.subscribe_data_change(self.M_PowerLength3)
        self.subscribe.subscribe_data_change(self.M_Start4)
        self.subscribe.subscribe_data_change(self.M_Reset4)
        self.subscribe.subscribe_data_change(self.M_Mode4)
        self.subscribe.subscribe_data_change(self.M_DataReady4)
        self.subscribe.subscribe_data_change(self.M_AlarmLock4)
        self.subscribe.subscribe_data_change(self.E_STOP4)
        self.subscribe.subscribe_data_change(self.M_BatchSize4)
        self.subscribe.subscribe_data_change(self.M_CycleCounter4)
        self.subscribe.subscribe_data_change(self.M_AlarmNumber4)
        self.subscribe.subscribe_data_change(self.M_Ready4)
        self.subscribe.subscribe_data_change(self.M_Alarm4)
        self.subscribe.subscribe_data_change(self.M_Sonics4)
        self.subscribe.subscribe_data_change(self.M_PPM4)
        self.subscribe.subscribe_data_change(self.M_CurrentTune4)
        self.subscribe.subscribe_data_change(self.M_CurrentFre_offset4)
        self.subscribe.subscribe_data_change(self.M_CurrentAmplitude4)
        self.subscribe.subscribe_data_change(self.M_CurrentPower4)
        self.subscribe.subscribe_data_change(self.M_PowerArray4)
        self.subscribe.subscribe_data_change(self.M_PowerLength4)

    sigOpcStatus = Signal(int, arguments=['status'])

    @Slot()
    def connectOPCUA(self):
        try:
            self.myclient.connect()
        except:
            self.sigOpcStatus.emit(1)
            print("opc连接失败")
            return
        else:
            self.subscribe = self.myclient.create_subscription(0, self)
            self.subNodesId()
            self.sigOpcStatus.emit(0)

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
    
    currentFre1_changed = Signal(int)
    currentFre2_changed = Signal(int)
    currentFre3_changed = Signal(int)
    currentFre4_changed = Signal(int)
    
    currentAmp1_changed = Signal(int)
    currentAmp2_changed = Signal(int)
    currentAmp3_changed = Signal(int)
    currentAmp4_changed = Signal(int)
    
    currentPower1_changed = Signal(int)
    currentPower2_changed = Signal(int)
    currentPower3_changed = Signal(int)
    currentPower4_changed = Signal(int)
    
    # powerArray1_changed = Signal(bool)
    # powerArray2_changed = Signal(bool)
    # powerArray3_changed = Signal(bool)
    # powerArray4_changed = Signal(bool)
    
    powerLength1_changed = Signal(int)
    powerLength2_changed = Signal(int)
    powerLength3_changed = Signal(int)
    powerLength4_changed = Signal(int)

    # M_start
    @Slot(bool)
    def setStart1(self, val):
        self.start1 = val
        self.start1_changed.emit(val)

    @Slot(result=int)
    def start1(self):
        return self.start1

    @Slot(bool)
    def setStart2(self, val):
        self.start2 = val
        self.start2_changed.emit(val)

    @Slot(result=bool)
    def start2(self):
        return self.start2

    @Slot(bool)
    def setStart3(self, val):
        self.start3 = val
        self.start3_changed.emit(val)

    @Slot(result=bool)
    def start3(self):
        return self.start3

    @Slot(bool)
    def setStart4(self, val):
        self.start4 = val
        self.start4_changed.emit(val)

    @Slot(result=bool)
    def start4(self):
        return self.start4

    # M_reSet
    @Slot(bool)
    def setReset1(self, val):
        self.reSet1 = val
        self.reSet1_changed.emit(val)

    @Slot(result=bool)
    def reSet1(self):
        return self.reSet1

    @Slot(bool)
    def setReset2(self, val):
        self.reSet2 = val
        self.reSet2_changed.emit(val)

    @Slot(result=bool)
    def reSet2(self):
        return self.reSet2

    @Slot(bool)
    def setReset3(self, val):
        self.reSet3 = val
        self.reSet3_changed.emit(val)

    @Slot(result=bool)
    def reSet3(self):
        return self.reSet3

    @Slot(bool)
    def setReset4(self, val):
        self.reSet4 = val
        self.reSet4_changed.emit(val)

    @Slot(result=bool)
    def reSet4(self):
        return self.reSet4

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
        self.dataReady1 = val
        self.dataReady1_changed.emit(val)

    @Slot(result=bool)
    def dataReady1(self):
        return self.dataReady1

    @Slot(bool)
    def setDataready2(self, val):
        self.dataReady2 = val
        self.dataReady2_changed.emit(val)

    @Slot(result=bool)
    def dataReady2(self):
        return self.dataReady2

    @Slot(bool)
    def setDataready3(self, val):
        self.dataReady3 = val
        self.dataReady3_changed.emit(val)

    @Slot(result=bool)
    def dataReady3(self):
        return self.dataReady3

    @Slot(bool)
    def setDataready4(self, val):
        self.dataReady4 = val
        self.dataReady4_changed.emit(val)

    @Slot(result=bool)
    def dataReady4(self):
        return self.dataReady4

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
        self.estop1 = val
        self.estop1_changed.emit(val)

    @Slot(result=bool)
    def estop1(self):
        return self.estop1

    @Slot(bool)
    def setEstop2(self, val):
        self.estop2 = val
        self.estop2_changed.emit(val)

    @Slot(result=bool)
    def estop2(self):
        return self.estop2

    @Slot(bool)
    def setEstop3(self, val):
        self.estop3 = val
        self.estop3_changed.emit(val)

    @Slot(result=bool)
    def estop3(self):
        return self.estop3

    @Slot(bool)
    def setEstop4(self, val):
        self.estop4 = val
        self.estop4_changed.emit(val)

    @Slot(result=bool)
    def estop4(self):
        return self.estop4

    # BatchSize
    @Slot(int)
    def setBatchSize1(self, val):
        self.batchSize1 = val
        self.batchSize1_changed.emit(val)

    @Slot(result=int)
    def batchSize1(self):
        return self.batchSize1

    @Slot(int)
    def setBatchSize2(self, val):
        self.batchSize2 = val
        self.batchSize2_changed.emit(val)

    @Slot(result=int)
    def batchSize2(self):
        return self.batchSize2

    @Slot(int)
    def setBatchSize3(self, val):
        self.batchSize3 = val
        self.batchSize3_changed.emit(val)

    @Slot(result=int)
    def batchSize3(self):
        return self.batchSize3

    @Slot(int)
    def setBatchSize4(self, val):
        self.batchSize4 = val
        self.batchSize4_changed.emit(val)

    @Slot(result=int)
    def batchSize4(self):
        return self.batchSize4

    # CycleCounter
    @Slot(int)
    def setCycleCounter1(self, val):
        self.cycleCounter1 = val
        self.cycleCounter1_changed.emit(val)

    @Slot(result=int)
    def cycleCounter1(self):
        return self.cycleCounter1

    @Slot(int)
    def setCycleCounter2(self, val):
        self.cycleCounter2 = val
        self.cycleCounter2_changed.emit(val)

    @Slot(result=int)
    def cycleCounter2(self):
        return self.cycleCounter2

    @Slot(int)
    def setCycleCounter3(self, val):
        self.cycleCounter3 = val
        self.cycleCounter3_changed.emit(val)

    @Slot(result=int)
    def cycleCounter3(self):
        return self.cycleCounter3

    @Slot(int)
    def setCycleCounter4(self, val):
        self.cycleCounter4 = val
        self.cycleCounter4_changed.emit(val)

    @Slot(result=int)
    def cycleCounter4(self):
        return self.cycleCounter4

    # AlarmNumbe
    @Slot(int)
    def setAlarmNumber1(self, val):
        self.alarmNumber1 = val
        self.alarmNumber1_changed.emit(val)

    @Slot(result=int)
    def alarmNumber1(self):
        return self.alarmNumber1

    @Slot(int)
    def setAlarmNumber2(self, val):
        self.alarmNumber2 = val
        self.alarmNumber2_changed.emit(val)

    @Slot(result=int)
    def alarmNumber2(self):
        return self.alarmNumber2

    @Slot(int)
    def setAlarmNumber3(self, val):
        self.alarmNumber3 = val
        self.alarmNumber3_changed.emit(val)

    @Slot(result=int)
    def alarmNumber3(self):
        return self.alarmNumber3

    @Slot(int)
    def setAlarmNumber4(self, val):
        self.alarmNumber4 = val
        self.alarmNumber4_changed.emit(val)

    @Slot(result=int)
    def alarmNumber4(self):
        return self.alarmNumber4

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
        self.alarm1 = val
        self.alarm1_changed.emit(val)

    @Slot(result=int)
    def alarm1(self):
        return self.alarm1

    @Slot(int)
    def setAlarm2(self, val):
        self.alarm2 = val
        self.alarm2_changed.emit(val)

    @Slot(result=int)
    def alarm2(self):
        return self.alarm2

    @Slot(int)
    def setAlarm3(self, val):
        self.alarm3 = val
        self.alarm3_changed.emit(val)

    @Slot(result=int)
    def alarm3(self):
        return self.alarm3

    @Slot(int)
    def setAlarm4(self, val):
        self.alarm4 = val
        self.alarm4_changed.emit(val)

    @Slot(result=int)
    def alarm4(self):
        return self.alarm4

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
        self.ppm1 = val
        self.ppm1_changed.emit(val)

    @Slot(result=int)
    def ppm1(self):
        return self.ppm1

    @Slot(int)
    def setPPM2(self, val):
        self.ppm2 = val
        self.ppm2_changed.emit(val)

    @Slot(result=int)
    def ppm2(self):
        return self.ppm2

    @Slot(int)
    def setPPM3(self, val):
        self.ppm3 = val
        self.ppm3_changed.emit(val)

    @Slot(result=int)
    def ppm3(self):
        return self.ppm3

    @Slot(int)
    def setPPM4(self, val):
        self.ppm4 = val
        self.ppm4_changed.emit(val)

    @Slot(result=int)
    def ppm4(self):
        return self.ppm4

    # CurrentTune
    @Slot(int)
    def setCurrentTune1(self, val):
        self.currentTune1 = val
        self.currentTune1_changed.emit(val)

    @Slot(result=int)
    def currentTune1(self):
        return self.currentTune1

    @Slot(int)
    def setCurrentTune2(self, val):
        self.currentTune2 = val
        self.currentTune2_changed.emit(val)

    @Slot(result=int)
    def currentTune2(self):
        return self.currentTune2

    @Slot(int)
    def setCurrentTune3(self, val):
        self.currentTune3 = val
        self.currentTune3_changed.emit(val)

    @Slot(result=int)
    def currentTune3(self):
        return self.currentTune3

    @Slot(int)
    def setCurrentTune4(self, val):
        self.currentTune4 = val
        self.currentTune4_changed.emit(val)

    @Slot(result=int)
    def currentTune4(self):
        return self.currentTune4

    # CurrentFre
    @Slot(int)
    def setCurrentFre1(self, val):
        self.currentFre1 = val
        self.currentFre1_changed.emit(val)

    @Slot(result=int)
    def currentFre1(self):
        return self.currentFre1

    @Slot(int)
    def setCurrentFre2(self, val):
        self.currentFre2 = val
        self.currentFre2_changed.emit(val)

    @Slot(result=int)
    def currentFre2(self):
        return self.currentFre2

    @Slot(int)
    def setCurrentFre3(self, val):
        self.currentFre3 = val
        self.currentFre3_changed.emit(val)

    @Slot(result=int)
    def currentFre3(self):
        return self.currentFre3

    @Slot(int)
    def setCurrentFre4(self, val):
        self.currentFre4 = val
        self.currentFre4_changed.emit(val)

    @Slot(result=int)
    def currentFre4(self):
        return self.currentFre4

    # CurrentAmp
    @Slot(int)
    def setCurrentAmp1(self, val):
        self.currentAmp1 = val
        self.currentAmp1_changed.emit(val)

    @Slot(result=int)
    def currentAmp1(self):
        return self.currentAmp1

    @Slot(int)
    def setCurrentAmp2(self, val):
        self.currentAmp2 = val
        self.currentAmp2_changed.emit(val)

    @Slot(result=int)
    def currentAmp2(self):
        return self.currentAmp2

    @Slot(int)
    def setCurrentAmp3(self, val):
        self.currentAmp3 = val
        self.currentAmp3_changed.emit(val)

    @Slot(result=int)
    def currentAmp3(self):
        return self.currentAmp3

    @Slot(int)
    def setCurrentAmp4(self, val):
        self.currentAmp4 = val
        self.currentAmp4_changed.emit(val)

    @Slot(result=int)
    def currentAmp4(self):
        return self.currentAmp4

    # CurrentPower
    @Slot(int)
    def setCurrentPower1(self, val):
        self.currentPower1 = val
        self.currentPower1_changed.emit(val)

    @Slot(result=int)
    def currentPower1(self):
        return self.currentPower1

    @Slot(int)
    def setCurrentPower2(self, val):
        self.currentPower2 = val
        self.currentPower2_changed.emit(val)

    @Slot(result=int)
    def currentPower2(self):
        return self.currentPower2

    @Slot(int)
    def setCurrentPower3(self, val):
        self.currentPower3 = val
        self.currentPower3_changed.emit(val)

    @Slot(result=int)
    def currentPower3(self):
        return self.currentPower3

    @Slot(int)
    def setCurrentPower4(self, val):
        self.currentPower4 = val
        self.currentPower4_changed.emit(val)

    @Slot(result=int)
    def currentPower4(self):
        return self.currentPower4

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
    
    mBatchSize1 = Property(int, batchSize1, setBatchSize1, notify=batchSize1_changed)
    mBatchSize2 = Property(int, batchSize2, setBatchSize2, notify=batchSize2_changed)
    mBatchSize3 = Property(int, batchSize3, setBatchSize3, notify=batchSize3_changed)
    mBatchSize4 = Property(int, batchSize4, setBatchSize4, notify=batchSize4_changed)
    
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
    
    mCurrentFre1 = Property(int, currentFre1, setCurrentFre1, notify=currentFre1_changed)
    mCurrentFre2 = Property(int, currentFre2, setCurrentFre2, notify=currentFre2_changed)
    mCurrentFre3 = Property(int, currentFre3, setCurrentFre3, notify=currentFre3_changed)
    mCurrentFre4 = Property(int, currentFre4, setCurrentFre4, notify=currentFre4_changed)
    
    mCurrentAmp1 = Property(int, currentAmp1, setCurrentAmp1, notify=currentAmp1_changed)
    mCurrentAmp2 = Property(int, currentAmp2, setCurrentAmp2, notify=currentAmp2_changed)
    mCurrentAmp3 = Property(int, currentAmp3, setCurrentAmp3, notify=currentAmp3_changed)
    mCurrentAmp4 = Property(int, currentAmp4, setCurrentAmp4, notify=currentAmp4_changed)
    
    mCurrentPower1 = Property(int, currentPower1, setCurrentPower1, notify=currentPower1_changed)
    mCurrentPower2 = Property(int, currentPower2, setCurrentPower2, notify=currentPower2_changed)
    mCurrentPower3 = Property(int, currentPower3, setCurrentPower3, notify=currentPower3_changed)
    mCurrentPower4 = Property(int, currentPower4, setCurrentPower4, notify=currentPower4_changed)
    
    # mPowerArray1 = Property(bool, powerArray1, setPowerArray1, notify=powerArray1_changed)
    # mPowerArray2 = Property(bool, powerArray2, setPowerArray2, notify=powerArray2_changed)
    # mPowerArray3 = Property(bool, powerArray3, setPowerArray3, notify=powerArray3_changed)
    # mPowerArray4 = Property(bool, powerArray4, setPowerArray4, notify=powerArray4_changed)
    
    mPowerLength1 = Property(int, powerLength1, setPowerLength1, notify=powerLength1_changed)
    mPowerLength2 = Property(int, powerLength2, setPowerLength2, notify=powerLength2_changed)
    mPowerLength3 = Property(int, powerLength3, setPowerLength3, notify=powerLength3_changed)
    mPowerLength4 = Property(int, powerLength4, setPowerLength4, notify=powerLength4_changed)

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
        elif node == self.M_CurrentFre_offset:
            self.setCurrentFre1(val)
        elif node == self.M_CurrentAmplitude:
            self.setCurrentAmp1(val)
        elif node == self.M_CurrentPower:
            self.setCurrentPower1(val)
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
        elif node == self.M_CurrentFre_offset2:
            self.setCurrentFre2(val)
        elif node == self.M_CurrentAmplitude2:
            self.setCurrentAmp2(val)
        elif node == self.M_CurrentPower2:
            self.setCurrentPower2(val)
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
        elif node == self.M_CurrentFre_offset3:
            self.setCurrentFre3(val)
        elif node == self.M_CurrentAmplitude3:
            self.setCurrentAmp3(val)
        elif node == self.M_CurrentPower3:
            self.setCurrentPower3(val)
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
        elif node == self.M_CurrentFre_offset4:
            self.setCurrentFre4(val)
        elif node == self.M_CurrentAmplitude4:
            self.setCurrentAmp4(val)
        elif node == self.M_CurrentPower4:
            self.setCurrentPower4(val)
        elif node == self.M_PowerLength4:
            self.setPowerLength4(val)