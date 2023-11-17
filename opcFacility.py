from PySide2.QtCore import QObject, Signal, Slot, Property
from opcua import Client, ua


class opcClient(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.pampsetting = ""
        self.penergysetting = ''
        self.ptPressuresetting = ''
        self.pwPressuresetting = ''
        self.pweldMode = ''
        self.pweldTime = ''
        self.mpeakPower = ''
        self.mpreHeight = ''
        self.postHeight = ''
        self.pmaxWeldTime = ''
        self.pminWeldTime = ''
        self.pmaxPower = ''
        self.pminPower = ''
        self.pmaxPreHeight = ''
        self.pminPreHeight = ''
        self.pmaxPostHeight = ''
        self.pminPostHeight = ''
        self.pcycleCounter = ''
        self.palarm = ''
        self.pweldEngery = ''

    @Slot(str, int)
    def connectOPCUA(self, ip, port):
        url = ip
        port = port
        endpoint = "opc.tcp://{}:{}".format(url, port)
        self.myclient = Client(endpoint)
        try:
            self.myclient.connect()
        except:
            print("opc连接失败")
        else:
            self.M_AmpSetting = self.myclient.get_node('ns=1;i=118')
            self.M_EnergySetting = self.myclient.get_node('ns=1;i=117')
            self.M_TPressureSetting = self.myclient.get_node('ns=1;i=119')
            self.M_WPressureSetting = self.myclient.get_node('ns=1;i=120')
            self.M_WeldMode = self.myclient.get_node('ns=1;i=107')
            self.M_WeldTime = self.myclient.get_node('ns=1;i=110')
            self.M_PeakPower = self.myclient.get_node('ns=1;i=111')
            self.M_PreHeight = self.myclient.get_node('ns=1;i=114')
            self.M_PostHeight = self.myclient.get_node('ns=1;i=115')
            self.M_MaxWeldTime = self.myclient.get_node('ns=1;i=121')
            self.M_MinWeldTime = self.myclient.get_node('ns=1;i=122')
            self.M_MaxPower = self.myclient.get_node('ns=1;i=123')
            self.M_MinPower = self.myclient.get_node('ns=1;i=124')
            self.M_MaxPreHeight = self.myclient.get_node('ns=1;i=125')
            self.M_MinPreHeight = self.myclient.get_node('ns=1;i=126')
            self.M_MaxPostHeight = self.myclient.get_node('ns=1;i=127')
            self.M_MinPostHeight = self.myclient.get_node('ns=1;i=128')
            self.M_CycleCounter = self.myclient.get_node('ns=1;i=102')
            self.M_Alarm = self.myclient.get_node('ns=1;i=116')
            self.M_WeldEngery = self.myclient.get_node('ns=1;i=108')
            self.subscribe = self.myclient.create_subscription(0, self)
            self.subNodesId()

    def disconnectOpc(self):
        self.myclient.disconnect()

    def subNodesId(self):
        self.subscribe.subscribe_data_change(self.M_AmpSetting)
        self.subscribe.subscribe_data_change(self.M_EnergySetting)
        self.subscribe.subscribe_data_change(self.M_TPressureSetting)
        self.subscribe.subscribe_data_change(self.M_WPressureSetting)
        self.subscribe.subscribe_data_change(self.M_WeldMode)
        self.subscribe.subscribe_data_change(self.M_WeldTime)
        self.subscribe.subscribe_data_change(self.M_PeakPower)
        self.subscribe.subscribe_data_change(self.M_PreHeight)
        self.subscribe.subscribe_data_change(self.M_PostHeight)
        self.subscribe.subscribe_data_change(self.M_MaxWeldTime)
        self.subscribe.subscribe_data_change(self.M_MinWeldTime)
        self.subscribe.subscribe_data_change(self.M_MaxPower)
        self.subscribe.subscribe_data_change(self.M_MinPower)
        self.subscribe.subscribe_data_change(self.M_MaxPreHeight)
        self.subscribe.subscribe_data_change(self.M_MinPreHeight)
        self.subscribe.subscribe_data_change(self.M_MaxPostHeight)
        self.subscribe.subscribe_data_change(self.M_MinPostHeight)
        self.subscribe.subscribe_data_change(self.M_CycleCounter)
        self.subscribe.subscribe_data_change(self.M_Alarm)
        self.subscribe.subscribe_data_change(self.M_WeldEngery)

    ampsetting_changed = Signal(int)
    energysetting_changed = Signal(int)
    tPressuresetting_changed = Signal(int)
    wPressuresetting_changed = Signal(int)
    weldMode_changed = Signal(int)
    weldTime_changed = Signal(int)
    peakPower_changed = Signal(int)
    preHeight_changed = Signal(int)
    postHeight_changed = Signal(int)
    maxWeldTime_changed = Signal(int)
    minWeldTime_changed = Signal(int)
    maxPower_changed = Signal(int)
    minPower_changed = Signal(int)
    maxPreHeight_changed = Signal(int)
    minPreHeight_changed = Signal(int)
    maxPostHeight_changed = Signal(int)
    minPostHeight_changed = Signal(int)
    cycleCounter_changed = Signal(int)
    alarm_changed = Signal(int)
    weldEngery_changed = Signal(int)

    @Slot(int)
    def setAmpSetting(self, val):
        self.pampsetting = val
        self.ampsetting_changed.emit(val)

    @Slot(result=int)
    def ampSetting(self):
        return self.pampsetting

    @Slot(int)
    def setEnergyetting(self, val):
        self.penergysetting = val
        self.energysetting_changed.emit(val)

    @Slot(result=int)
    def energySetting(self):
        return self.penergysetting

    @Slot(int)
    def setTPressureSetting(self, val):
        self.ptPressuresetting = val
        self.tPressuresetting_changed.emit(val)

    @Slot(result=int)
    def tPressureSetting(self):
        return self.ptPressuresetting

    @Slot(int)
    def setWPressureSetting(self, val):
        self.pwPressuresetting = val
        self.wPressuresetting_changed.emit(val)

    @Slot(result=int)
    def wPressureSetting(self):
        return self.pwPressuresetting

    @Slot(int)
    def setWeldMode(self, val):
        self.pweldMode = val
        self.weldMode_changed.emit(val)

    @Slot(result=int)
    def weldMode(self):
        return self.pweldMode

    @Slot(int)
    def setWeldTime(self, val):
        self.pweldTime = val
        self.weldTime_changed.emit(val)

    @Slot(result=int)
    def weldTime(self):
        return self.pweldTime

    @Slot(int)
    def setPeakPower(self, val):
        self.mpeakPower = val
        self.peakPower_changed.emit(val)

    @Slot(result=int)
    def peakPower(self):
        return self.mpeakPower

    @Slot(int)
    def setPreHeight(self, val):
        self.mpreHeight = val
        self.preHeight_changed.emit(val)

    @Slot(result=int)
    def preHeight(self):
        return self.mpreHeight

    @Slot(int)
    def setPostHeight(self, val):
        self.postHeight = val
        self.postHeight_changed.emit(val)

    @Slot(result=int)
    def postHeight(self):
        return self.postHeight

    @Slot(int)
    def setMaxWeldTime(self, val):
        self.pmaxWeldTime = val
        self.maxWeldTime_changed.emit(val)

    @Slot(result=int)
    def maxWeldTime(self):
        return self.pmaxWeldTime

    @Slot(int)
    def setMinWeldTime(self, val):
        self.pminWeldTime = val
        self.minWeldTime_changed.emit(val)

    @Slot(result=int)
    def minWeldTime(self):
        return self.pminWeldTime

    @Slot(int)
    def setMaxPower(self, val):
        self.pmaxPower = val
        self.maxPower_changed.emit(val)

    @Slot(result=int)
    def maxPower(self):
        return self.pmaxPower

    @Slot(int)
    def setMinPower(self, val):
        self.pminPower = val
        self.minPower_changed.emit(val)

    @Slot(result=int)
    def minPower(self):
        return self.pminPower

    @Slot(int)
    def setMaxPreHeight(self, val):
        self.pmaxPreHeight = val
        self.maxPreHeight_changed.emit(val)

    @Slot(result=int)
    def maxPreHeight(self):
        return self.pmaxPreHeight

    @Slot(int)
    def setMinPreHeight(self, val):
        self.pminPreHeight = val
        self.minPreHeight_changed.emit(val)

    @Slot(result=int)
    def minPreHeight(self):
        return self.pminPreHeight

    @Slot(int)
    def setMaxPostHeight(self, val):
        self.pmaxPostHeight = val
        self.maxPostHeight_changed.emit(val)

    @Slot(result=int)
    def maxPostHeight(self):
        return self.pmaxPostHeight

    @Slot(int)
    def setMinPostHeight(self, val):
        self.pminPostHeight = val
        self.minPostHeight_changed.emit(val)

    @Slot(result=int)
    def minPostHeight(self):
        return self.pminPostHeight

    @Slot(int)
    def setCycleCounter(self, val):
        self.pcycleCounter = val
        self.cycleCounter_changed.emit(val)

    @Slot(result=int)
    def cycleCounter(self):
        return self.pcycleCounter

    @Slot(int)
    def setAlarm(self, val):
        self.palarm = val
        self.alarm_changed.emit(val)

    @Slot(result=int)
    def alarm(self):
        return self.palarm

    @Slot(int)
    def setWeldEngery(self, val):
        self.pweldEngery = val
        self.weldEngery_changed.emit(val)

    @Slot(result=int)
    def weldEngery(self):
        return self.pweldEngery

    mAmpSetting = Property(int, ampSetting, setAmpSetting, notify=ampsetting_changed)
    mEnergySetting = Property(int, energySetting, setEnergyetting, notify=energysetting_changed)
    mTPressureSetting = Property(int, tPressureSetting, setTPressureSetting, notify=tPressuresetting_changed)
    mWPressureSetting = Property(int, wPressureSetting, setWPressureSetting, notify=wPressuresetting_changed)
    mWeldMode = Property(int, weldMode, setWeldMode, notify=weldMode_changed)
    mWeldTime = Property(int, weldTime, setWeldTime, notify=weldTime_changed)
    mWeakPower = Property(int, peakPower, setPeakPower, notify=peakPower_changed)
    mPreHeight = Property(int, preHeight, setPreHeight, notify=preHeight_changed)
    mPostHeight = Property(int, postHeight, setPostHeight, notify=postHeight_changed)
    mMaxWeldTime = Property(int, maxWeldTime, setMaxWeldTime, notify=maxWeldTime_changed)
    mMinWeldTime = Property(int, minWeldTime, setMinWeldTime, notify=minWeldTime_changed)
    mMaxPower = Property(int, maxPower, setMaxPower, notify=maxPower_changed)
    mMinPower = Property(int, minPower, setMinPower, notify=minPower_changed)
    mMaxPreHeight = Property(int, maxPreHeight, setMaxPreHeight, notify=maxPreHeight_changed)
    mMinPreHeight = Property(int, minPreHeight, setMinPreHeight, notify=minPreHeight_changed)
    mMaxPostHeight = Property(int, maxPostHeight, setMaxPostHeight, notify=maxPostHeight_changed)
    mMinPostHeight = Property(int, minPostHeight, setMinPostHeight, notify=minPostHeight_changed)
    mCycleCounter = Property(int, cycleCounter, setCycleCounter, notify=cycleCounter_changed)
    mAlarm = Property(int, alarm, setAlarm, notify=alarm_changed)
    mWeldEngery = Property(int, weldEngery, setWeldEngery, notify=weldEngery_changed)

    def datachange_notification(self, node, val, data):
        print(node, node)
        if node == self.M_AmpSetting:
            self.setAmpSetting(val)
        elif node == self.M_EnergySetting:
            self.setEnergyetting(val)
        elif node == self.M_TPressureSetting:
            self.setTPressureSetting(val)
        elif node == self.M_WPressureSetting:
            self.setWPressureSetting(val)
        elif node == self.M_WeldMode:
            self.setWeldMode(val)
        elif node == self.M_WeldTime:
            self.setWeldTime(val)
        elif node == self.M_PeakPower:
            self.setPeakPower(val)
        elif node == self.M_PreHeight:
            self.setPreHeight(val)
        elif node == self.M_PostHeight:
            self.setPostHeight(val)
        elif node == self.M_MaxWeldTime:
            self.setMaxWeldTime(val)
        elif node == self.M_MinWeldTime:
            self.setMinWeldTime(val)
        elif node == self.M_MaxPower:
            self.setMaxPower(val)
        elif node == self.M_MinPower:
            self.setMinPower(val)
        elif node == self.M_MaxPreHeight:
            self.setMaxPreHeight(val)
        elif node == self.M_MinPreHeight:
            self.setMinPreHeight(val)
        elif node == self.M_MaxPostHeight:
            self.setMaxPostHeight(val)
        elif node == self.M_MinPostHeight:
            self.setMinPostHeight(val)
        elif node == self.M_CycleCounter:
            self.setCycleCounter(val)
        elif node == self.M_Alarm:
            self.setAlarm(val)
        elif node == self.M_WeldEngery:
            self.setWeldEngery(val)