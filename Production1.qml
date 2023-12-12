import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as SwitchGroup
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id:root
    signal signalBackLogin()
    property double plcTableHei: 120
    property double machinedataTableHei: 330
    property string currentIp: ""
    property string currentPort: ""
    property int currentMode: 1
    property bool modeStatus: true
    property bool e_StopStatus: false
    property var startTimeData: ""
    property int currentPower: {
        if(machinename.currentIndex === 0){
            return opcua.mCurrentPower1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mCurrentPower2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mCurrentPower3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mCurrentPower4
        }
    }
    property int mincurrentPower: {
        if(machinename.currentIndex === 0){
            return opcua.mminCurrentPower1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mminCurrentPower2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mminCurrentPower3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mminCurrentPower4
        }
    }
    property int maxcurrentPower: {
        if(machinename.currentIndex === 0){
            return opcua.mmaxCurrentPower1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mmaxCurrentPower2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mmaxCurrentPower3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mmaxCurrentPower4
        }
    }

    property int currentTune: {
        if(machinename.currentIndex === 0){
            return opcua.mCurrentTune1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mCurrentTune2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mCurrentTune3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mCurrentTune4
        }
        else{
            return ""
        }
    }
    property int mincurrentTune: {
        if(machinename.currentIndex === 0){
            if(opcua.mminCurrentTune1 === 0){
                return opcua.mCurrentTune1
            }
            else{
                return opcua.mminCurrentTune1
            }
        }
        else if(machinename.currentIndex === 1){
            if(opcua.mminCurrentTune2 === 0){
                return opcua.mCurrentTune2
            }
            else{
                return opcua.mminCurrentTune2
            }
        }
        else if(machinename.currentIndex === 2){
            if(opcua.mminCurrentTune3 === 0){
                return opcua.mCurrentTune3
            }
            else{
                return opcua.mminCurrentTune3
            }
        }
        else if(machinename.currentIndex === 3){
            if(opcua.mminCurrentTune4 === 0){
                return opcua.mCurrentTune4
            }
            else{
                return opcua.mminCurrentTune4
            }
        }
    }
    property int maxcurrentTune: {
        if(machinename.currentIndex === 0){
            if(opcua.mmaxCurrentTune1 === 0){
                return opcua.mCurrentTune1
            }
            else{
                return opcua.mmaxCurrentTune1
            }
        }
        else if(machinename.currentIndex === 1){
            if(opcua.mmaxCurrentTune2 === 0){
                return opcua.mCurrentTune2
            }
            else{
                return opcua.mmaxCurrentTune2
            }
        }
        else if(machinename.currentIndex === 2){
            if(opcua.mmaxCurrentTune3 === 0){
                return opcua.mCurrentTune3
            }
            else{
                return opcua.mmaxCurrentTune3
            }
        }
        else if(machinename.currentIndex === 3){
            if(opcua.mmaxCurrentTune4 === 0){
                return opcua.mCurrentTune4
            }
            else{
                return opcua.mmaxCurrentTune4
            }
        }
    }

    property int currentFre: {
        if(machinename.currentIndex === 0){
            return opcua.mCurrentFre1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mCurrentFre2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mCurrentFre3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mCurrentFre4
        }
    }
    property int mincurrentFre: {
        if(machinename.currentIndex === 0){
            if(opcua.mminCurrentFre1 === 0){
                return opcua.mCurrentFre1
            }
            else{
                return opcua.mminCurrentFre1
            }
        }
        else if(machinename.currentIndex === 1){
            if(opcua.mminCurrentFre2 === 0){
                return opcua.mCurrentFre2
            }
            else{
                return opcua.mminCurrentFre2
            }
        }
        else if(machinename.currentIndex === 2){
            if(opcua.mminCurrentFre3 === 0){
                return opcua.mCurrentFre3
            }
            else{
                return opcua.mminCurrentFre3
            }
        }
        else if(machinename.currentIndex === 3){
            if(opcua.mminCurrentFre4 === 0){
                return opcua.mCurrentFre4
            }
            else{
                return opcua.mminCurrentFre4
            }
        }
    }
    property int maxcurrentFre: {
        if(machinename.currentIndex === 0){
            if(opcua.mmaxCurrentFre1 === 0){
                return opcua.mCurrentFre1
            }
            else{
                return opcua.mmaxCurrentFre1
            }
        }
        else if(machinename.currentIndex === 1){
            if(opcua.mmaxCurrentFre2 === 0){
                return opcua.mCurrentFre2
            }
            else{
                return opcua.mmaxCurrentFre2
            }
        }
        else if(machinename.currentIndex === 2){
            if(opcua.mmaxCurrentFre3 === 0){
                return opcua.mCurrentFre3
            }
            else{
                return opcua.mmaxCurrentFre3
            }
        }
        else if(machinename.currentIndex === 3){
            if(opcua.mmaxCurrentFre4 === 0){
                return opcua.mCurrentFre4
            }
            else{
                return opcua.mmaxCurrentFre4
            }
        }
    }

    property int currentAmp: {
        if(machinename.currentIndex === 0){
            return opcua.mCurrentAmp1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mCurrentAmp2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mCurrentAmp3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mCurrentAmp4
        }
    }
    property int mincurrentAmp: {
        if(machinename.currentIndex === 0){
            if(opcua.mminCurrentAmp1 === 0){
                return opcua.mCurrentAmp1
            }
            else{
                return opcua.mminCurrentAmp1
            }
        }
        else if(machinename.currentIndex === 1){
            if(opcua.mminCurrentAmp2 === 0){
                return opcua.mCurrentAmp2
            }
            else{
                return opcua.mminCurrentAmp2
            }
        }
        else if(machinename.currentIndex === 2){
            if(opcua.mminCurrentAmp3 === 0){
                return opcua.mCurrentAmp3
            }
            else{
                return opcua.mminCurrentAmp3
            }
        }
        else if(machinename.currentIndex === 3){
            if(opcua.mminCurrentAmp4 === 0){
                return opcua.mCurrentAmp4
            }
            else{
                return opcua.mminCurrentAmp4
            }
        }
    }
    property int maxcurrentAmp: {
        if(machinename.currentIndex === 0){
            if(opcua.mmaxCurrentAmp1 === 0){
                return opcua.mCurrentAmp1
            }
            else{
                return opcua.mmaxCurrentAmp1
            }
        }
        else if(machinename.currentIndex === 1){
            if(opcua.mmaxCurrentAmp2 === 0){
                return opcua.mCurrentAmp2
            }
            else{
                return opcua.mmaxCurrentAmp2
            }
        }
        else if(machinename.currentIndex === 2){
            if(opcua.mmaxCurrentAmp3 === 0){
                return opcua.mCurrentAmp3
            }
            else{
                return opcua.mmaxCurrentAmp3
            }
        }
        else if(machinename.currentIndex === 3){
            if(opcua.mmaxCurrentAmp4 === 0){
                return opcua.mCurrentAmp4
            }
            else{
                return opcua.mmaxCurrentAmp4
            }
        }
    }
    property int cycleCounter: {
        if(machinename.currentIndex === 0){
            return opcua.mCycleCounter1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mCycleCounter2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mCycleCounter3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mCycleCounter4
        }
    }
    property bool reSetBtn: {
        if(machinename.currentIndex === 0){
            return opcua.mReset1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mReset2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mReset3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mReset4
        }
    }
    property int alarm: {
        if(machinename.currentIndex === 0){
            return opcua.mAlarm1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mAlarm2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mAlarm3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mAlarm4
        }
    }

    property bool currentEstop: {
        if(machinename.currentIndex === 0){
            return opcua.mEstop1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mEstop2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mEstop3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mEstop4
        }
    }
    property bool currentMstart: {
        if(machinename.currentIndex === 0){
            return opcua.mStart1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mStart2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mStart3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mStart4
        }
    }
    property int currentBatchSize: {
        if(machinename.currentIndex === 0){
            return opcua.mBatchSize1
        }
        else if(machinename.currentIndex === 1){
            return opcua.mBatchSize2
        }
        else if(machinename.currentIndex === 2){
            return opcua.mBatchSize3
        }
        else if(machinename.currentIndex === 3){
            return opcua.mBatchSize4
        }
    }

    property int mAmpSetting: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mAmpSetting
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mAmpSetting
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mAmpSetting
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mAmpSetting
            }
        }
        else{
            return 0
        }
    }

    property int mEnergySetting: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mEnergySetting
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mEnergySetting
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mEnergySetting
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mEnergySetting
            }
        }
        else{
            return 0
        }
    }
    property int mTPressureSetting: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mTPressureSetting
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mTPressureSetting
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mTPressureSetting
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mTPressureSetting
            }
        }
        else{
            return 0
        }
    }
    property int mWPressureSetting: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mWPressureSetting
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mWPressureSetting
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mWPressureSetting
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mWPressureSetting
            }
        }
        else{
            return 0
        }
    }
    property int mWeldMode: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mWeldMode
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mWeldMode
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mWeldMode
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mWeldMode
            }
        }
        else{
            return 0
        }
    }
    property int mWeldTime: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mWeldTime
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mWeldTime
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mWeldTime
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mWeldTime
            }
        }
        else{
            return 0
        }
    }
    property int mWeakPower: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mWeakPower
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mWeakPower
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mWeakPower
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mWeakPower
            }
        }
        else{
            return 0
        }
    }
    property int mPreHeight: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mPreHeight
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mPreHeight
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mPreHeight
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mPreHeight
            }
        }
        else{
            return 0
        }
    }
    property int mPostHeight: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mPostHeight
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mPostHeight
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mPostHeight
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mPostHeight
            }
        }
        else{
            return 0
        }
    }
    property int mMaxWeldTime: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMaxWeldTime
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMaxWeldTime
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMaxWeldTime
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMaxWeldTime
            }
        }
        else{
            return 0
        }
    }
    property int mMinWeldTime: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMinWeldTime
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMinWeldTime
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMinWeldTime
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMinWeldTime
            }
        }
        else{
            return 0
        }
    }
    property int mMaxPower: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMaxPower
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMaxPower
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMaxPower
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMaxPower
            }
        }
        else{
            return 0
        }
    }
    property int mMinPower: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMinPower
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMinPower
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMinPower
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMinPower
            }
        }
        else{
            return 0
        }
    }
    property int mMaxPreHeight: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMaxPreHeight
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMaxPreHeight
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMaxPreHeight
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMaxPreHeight
            }
        }
        else{
            return 0
        }
    }
    property int mMinPreHeight: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMinPreHeight
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMinPreHeight
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMinPreHeight
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMinPreHeight
            }
        }
        else{
            return 0
        }
    }
    property int mMaxPostHeight: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMaxPostHeight
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMaxPostHeight
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMaxPostHeight
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMaxPostHeight
            }
        }
        else{
            return 0
        }
    }
    property int mMinPostHeight: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mMinPostHeight
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mMinPostHeight
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mMinPostHeight
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mMinPostHeight
            }
        }
        else{
            return 0
        }
    }
    property int mCycleCounter: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mCycleCounter
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mCycleCounter
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mCycleCounter
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mCycleCounter
            }
        }
        else{
            return 0
        }
    }
    property int mAlarm: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mAlarm
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mAlarm
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mAlarm
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mAlarm
            }
        }
        else{
            return 0
        }
    }
    property int mWeldEngery: {
        if(dataprocessing.checked === true){
            if(machinename.currentIndex === 0){
                return opcFacility1.mWeldEngery
            }
            else if(machinename.currentIndex === 1){
                return opcFacility2.mWeldEngery
            }
            else if(machinename.currentIndex === 2){
                return opcFacility3.mWeldEngery
            }
            else if(machinename.currentIndex === 3){
                return opcFacility4.mWeldEngery
            }
        }
        else{
            return 0
        }
    }
    function newStart(){
        opcua.resetData()
        opcua.updateCycleCounter(machinename.currentIndex,0)
        opcua.updateAlarmNumber(machinename.currentIndex,0)
        if(manual.checked === true){
            moder.text = manual.text
        }
        else if(auto.checked === true){
            moder.text = auto.text
        }
        else if(merecycle.checked === true){
            moder.text = merecycle.text
        }
        startTimeData = new Date
        stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
        initTime = stime.text
        etime.text = "N/A"
        opcua.updateStart(machinename.currentIndex, 1)
        if(manual.checked === true){
            timer.start()
        }
    }
    onCurrentMstartChanged: {
        //        if(currentMstart === true){
        //            savebtn.enabled = false
        //        }
        //        else{
        //            savebtn.enabled = true
        //        }
    }

    onReSetBtnChanged: {
        if(reSetBtn === true  &&  alarm === 0){
            opcua.updateReset(machinename.currentIndex, 0)
        }
    }
    onAlarmChanged: {
        if(alarm === 0){
            opcua.updateReset(machinename.currentIndex, 0)
        }
        else{
            var type = 1
            var desc = "Machine Alarm"
            if(alarm === 1){
                type = 1
                desc = "Machine Alarm"
            }
            else if(alarm === 2){
                type = 2
                desc = "Batch Size Met Alarm"
            }
            var btime = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
            AlarmLog.insertLog(productionIndex,arun.text,type,desc,btime)
        }
    }
    onCurrentEstopChanged: {
        if(currentEstop === false){
            e_StopStatus = true
            var desc = "E-Stop Alarm"
            var btime = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
            AlarmLog.insertLog(productionIndex,arun.text,5,desc,btime)
        }
        else{
            e_StopStatus = false
        }
    }

    Component.onCompleted: {
        if(productionIndex === 1){
            batchsizedata.text = opcua.mBatchSize1
        }
        else if(productionIndex === 2){
            batchsizedata.text = opcua.mBatchSize2
        }
        else if(productionIndex === 3){
            batchsizedata.text = opcua.mBatchSize3
        }
        else if(productionIndex === 4){
            batchsizedata.text = opcua.mBatchSize4
        }
        ConfigurationQml.selectMachName(productionIndex)
    }
    Connections{
        target:ConfigurationQml
        function onSigMachName(list){
            machineinfor.text = list[0]
            currentIp = list[1]
            currentPort = list[2]
            batchsizedata.text = list[3]
            if(list[4] === 1){
                auto.checked = true
            }
            else if(list[4] === 2){
                merecycle.checked = true
            }
            else{
                manual.checked = true
            }
            if(list[5] === 1){
                alarmlock.checked = true
            }
            else{
                alarmlock.checked = false
            }
            dataprocessing.checked = false
            if(list[6] === 1){
                dataprocessing.checked = true
            }
            else{
                dataprocessing.checked = false
            }
        }
        function onConfig(list){
            if(list[0] === 1){
                opcua.updateMode(0,list[3])
                opcua.updateBatchSize(0,list[8])
            }
            else if(list[0] === 2){
                opcua.updateMode(1,list[3])
                opcua.updateBatchSize(1,list[8])
            }
            else if(list[0] === 3){
                opcua.updateMode(2,list[3])
                opcua.updateBatchSize(2,list[8])
            }
            else if(list[0] === 4){
                opcua.updateMode(3,list[3])
                opcua.updateBatchSize(3,list[8])
            }
        }
    }
    Connections{
        target:ConfigurationQml
        function onCache(list){
            if(list[0] === 0){
                manual.checked = true
                currentMode = 0
            }
            else if(list[0] === 1){
                auto.checked = true
                currentMode = 1
            }
            else if(list[0] === 2){
                merecycle.checked = true
                currentMode = 2
            }
            batchsizedata.text = list[1]
            if(list[2] === 0){
                alarmlock.checked = false
            }
            else{
                alarmlock.checked = true
            }
        }
    }
    Timer{
        id: timer
        interval: 100//100ms
        //        running: true//开启
        onTriggered:{
            opcua.updateStart(machinename.currentIndex,0)
            timer2.start()
        }
    }
    Timer{
        id: timer1
        interval: 100//100ms
        //        running: true//开启
        onTriggered:{
            opcua.updateReset(machinename.currentIndex,0)
        }
    }
    Timer{
        id: timer2
        interval: 500//100ms
        //        running: true//开启
        onTriggered:{
            var time = new Date()
            etime.text = time.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd hh:mm:ss")
            if(machinename.currentIndex === 0){
                runInfo.insertRunInfoData(productionIndex,startTimeData.getTime(),time.getTime(),opcua.cycleCounter1(),currentMode,ConfigurationQml.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber1())
            }
            else if(machinename.currentIndex === 1){
                runInfo.insertRunInfoData(productionIndex,startTimeData.getTime(),time.getTime(),opcua.cycleCounter2(),currentMode,ConfigurationQml.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber2())
            }
            else if(machinename.currentIndex === 2){
                runInfo.insertRunInfoData(productionIndex,startTimeData.getTime(),time.getTime(),opcua.cycleCounter3(),currentMode,ConfigurationQml.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber3())
            }
            else if(machinename.currentIndex === 3){
                runInfo.insertRunInfoData(productionIndex,startTimeData.getTime(),time.getTime(),opcua.cycleCounter4(),currentMode,ConfigurationQml.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber4())
            }
        }
    }
    Text {
        id: machineselected
        x: multipleWidth*60
        y: multipleHeight*37
        width: multipleWidth* 164
        height: multipleHeight* 28
        text: qsTr("Machine Selected")
        font.family: fregular.name
        color: "#000000"
        font.pixelSize: multipleWidth* 20
    }
    ComboBox{
        id: machinename
        width: multipleWidth* 100
        height: multipleHeight* 32
        x: multipleWidth*259
        y: multipleHeight*35
//        enabled: {
//            if(pop.visible === true){
//                return false
//            }
//            return !currentMstart
//        }
        font.pixelSize: multipleWidth*20
        font.family: fregular.name
        model: ListModel {
            id: model
            ListElement { text: "1#" }
            ListElement { text: "2#" }
            ListElement { text: "3#" }
            ListElement { text: "4#" }
        }
        background: Rectangle {
            border.color: "#BBBBBB"
        }
        indicator: Image {
            x: machinename.width - width - machinename.rightPadding
            y: multipleHeight* machinename.topPadding + (machinename.availableHeight - height) / 2
            width: multipleWidth* 16
            height: multipleHeight* 16
            source: "images/下拉.png"
        }
        onActivated: {
            productionIndex = currentIndex + 1
            ConfigurationQml.selectMachName(currentIndex+1)
            ConfigurationQml.initProduction(productionIndex)
            if(productionIndex === 1){
                batchsizedata.text = opcua.mBatchSize1
            }
            else if(productionIndex === 2){
                batchsizedata.text = opcua.mBatchSize2
            }
            else if(productionIndex === 3){
                batchsizedata.text = opcua.mBatchSize3
            }
            else if(productionIndex === 4){
                batchsizedata.text = opcua.mBatchSize4
            }
            savebtn.batchSizeChange = false
            if(currentMstart === true){
                stime.text = initTime
            }
        }
        Component.onCompleted: {
            currentIndex = productionIndex - 1
            if(currentMstart === true){
                stime.text = initTime
            }
            if(currentMode === 1){
                moder.text = auto.text
            }
            else if(currentMode === 0){
                moder.text = manual.text
            }
            else if(currentMode === 2){
                moder.text = merecycle.text
            }
            if(ConfigurationQml.currentDataprocessing(productionIndex) === 0){
                dataprocessing.checked = false
            }
            else{
                dataprocessing.checked = true
            }
        }
    }
    Rectangle{
        id:switchradio
        x: multipleWidth*55
        y: multipleHeight*122
        width: multipleWidth* 389
        height: multipleHeight* 33
        enabled: {
            if(pop.visible === true){
                return false
            }
            return !currentMstart
        }
        Component.onCompleted: {
            ConfigurationQml.initProduction(productionIndex)
        }

        RadioButton{
            id: manual
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text: "Manual"
            font.family: fregular.name
            //            spacing: 10
            font.pixelSize: multipleWidth*20
            indicator: Rectangle {
                width: multipleWidth* 26
                height: multipleHeight* 26
                x: multipleWidth* manual.x
                y: parent.height / 2 - height / 2
                radius: multipleWidth* 13
                border.color: manual.checked ? "#3D7AB3" : "#9A9A9A"
                Rectangle {
                    color: "#3D7AB3"
                    width: multipleWidth* 18
                    height: multipleHeight* 18
                    x: multipleWidth* 4
                    y: multipleHeight* 4
                    radius: multipleWidth* 9
                    visible: manual.checked
                }
            }
            onPressed: {
                alarmlock.checked = false
                dataprocessing.checked = false
                opcua.updateDataReady(machinename.currentIndex,1)
                modeStatus = true
            }
            onReleased: {
                opcua.updateAlarmLock(machinename.currentIndex,0)
                opcua.updateMode(machinename.currentIndex, 0)
                ConfigurationQml.updateMode(productionIndex, 0)
                ConfigurationQml.updateAlarmLock(productionIndex, 0)
                currentMode = 0
            }
        }
        RadioButton{
            id: auto
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: manual.right
            anchors.leftMargin: multipleWidth*35
            text: "Auto  "
            font.family: fregular.name
            //            spacing: 20
            font.pixelSize: multipleWidth*20
            indicator: Rectangle {
                implicitWidth: multipleWidth* 26
                implicitHeight: multipleHeight* 26
                x: multipleWidth* auto.leftPadding
                y: parent.height / 2 - height / 2
                radius: multipleWidth* 13
                border.color: auto.checked ? "#3D7AB3" : "#9A9A9A"
                Rectangle {
                    color: "#3D7AB3"
                    width: multipleWidth* 18
                    height: multipleHeight* 18
                    x: multipleWidth* 4
                    y: multipleHeight* 4
                    radius: multipleWidth* 9
                    visible: auto.checked
                }
            }
            onPressed: {
                alarmlock.checked = false
                dataprocessing.checked = false
                opcua.updateDataReady(machinename.currentIndex,1)
                modeStatus = true
            }
            onReleased: {
                opcua.updateMode(machinename.currentIndex, 1)
                ConfigurationQml.updateMode(productionIndex, 1)
                ConfigurationQml.updateAlarmLock(productionIndex, 0)
                currentMode = 1
            }
        }
        RadioButton{
            id: merecycle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: auto.right
            anchors.leftMargin: multipleWidth*70
            text: "Merecycle"
            font.family: fregular.name
            //            spacing: 20
            font.pixelSize: multipleWidth*20
            indicator: Rectangle {
                implicitWidth: multipleWidth* 26
                implicitHeight: multipleHeight* 26
                x: multipleWidth* merecycle.leftPadding
                y: parent.height / 2 - height / 2
                radius: multipleWidth* 13
                border.color: merecycle.checked ? "#3D7AB3" : "#9A9A9A"
                Rectangle {
                    color: "#3D7AB3"
                    width: multipleWidth* 18
                    height: multipleHeight* 18
                    x: multipleWidth* 4
                    y: multipleHeight* 4
                    radius: multipleWidth* 9
                    visible: merecycle.checked
                }
            }
            onPressed: {
                alarmlock.checked = false
                dataprocessing.checked = false
                opcua.updateDataReady(machinename.currentIndex,1)
                modeStatus = true
            }
            onReleased: {
                opcua.updateAlarmLock(machinename.currentIndex,0)
                opcua.updateMode(machinename.currentIndex, 2)
                ConfigurationQml.updateMode(productionIndex, 2)
                ConfigurationQml.updateAlarmLock(productionIndex, 0)
                currentMode = 2
            }
        }
    }

    CheckBox{
        id:alarmlock
        x: multipleWidth*55
        y: multipleHeight*185
        width: multipleWidth* 185
        height: multipleHeight* 33
        text: " Alarm Lock"
        font.family: fregular.name
        font.pixelSize: multipleWidth* 20
        enabled: {
            if(pop.visible === true){
                return false
            }
            if(auto.checked === true && currentMstart === false){
                return true
            }
            else{
                return false
            }
        }
        onClicked: {
            if(checked === true){
                ConfigurationQml.updateAlarmLock(productionIndex,1)
                opcua.updateAlarmLock(machinename.currentIndex,1)
            }
            else{
                ConfigurationQml.updateAlarmLock(productionIndex,0)
                opcua.updateAlarmLock(machinename.currentIndex,0)
            }
        }
    }
    CheckBox{
        id:dataprocessing
        text: " Data Processing"
        font.family: fregular.name
        x: multipleWidth*270
        y: multipleHeight*185
        width: multipleWidth* 210
        height: multipleHeight* 33
        font.pixelSize: multipleWidth* 20
        enabled: {
            if(pop.visible === true){
                return false
            }
            if(merecycle.checked === false && currentMstart === false){
                return true
            }
            else{
                return false
            }
        }
        onReleased: {
            if(checked === false){
                opcua.updateDataReady(machinename.currentIndex,1)
            }
        }
        property bool tmp: true
        onCheckedChanged: {
            if(tmp === true){
                if(checked === true){
                    if(machinename.currentIndex === 0){
                        ConfigurationQml.updateDataProcessing(1,1)
                        opcFacility1.connectOPCUA(ConfigurationQml.currentIp(1), ConfigurationQml.currentPort(1))
                    }
                    else if(machinename.currentIndex === 1){
                        ConfigurationQml.updateDataProcessing(2,1)
                        opcFacility2.connectOPCUA(ConfigurationQml.currentIp(2), ConfigurationQml.currentPort(2))
                    }
                    else if(machinename.currentIndex === 2){
                        ConfigurationQml.updateDataProcessing(3,1)
                        opcFacility3.connectOPCUA(ConfigurationQml.currentIp(3), ConfigurationQml.currentPort(3))
                    }
                    else if(machinename.currentIndex === 3){
                        ConfigurationQml.updateDataProcessing(4,1)
                        opcFacility4.connectOPCUA(ConfigurationQml.currentIp(4), ConfigurationQml.currentPort(4))
                    }
                }
                else{
                    if(machinename.currentIndex === 0){
                        ConfigurationQml.updateDataProcessing(1,0)
                        opcFacility1.disconnectOpc()
                    }
                    else if(machinename.currentIndex === 1){
                        ConfigurationQml.updateDataProcessing(2,0)
                        opcFacility2.disconnectOpc()
                    }
                    else if(machinename.currentIndex === 2){
                        ConfigurationQml.updateDataProcessing(3,0)
                        opcFacility3.disconnectOpc()
                    }
                    else if(machinename.currentIndex === 3){
                        ConfigurationQml.updateDataProcessing(4,0)
                        opcFacility4.disconnectOpc()
                    }
                }
            }
        }
        Component.onCompleted: {
            tmp = true
        }
    }
    Text {
        id: batchsize
        width: multipleWidth* 101
        x: multipleWidth*60
        y: multipleHeight*247
        text: qsTr("Batch Size:")
        font.family: fregular.name
        font.pixelSize: multipleWidth* 20
    }
    Rectangle{
        id:batchsizeedit
        width: multipleWidth* 88
        height: multipleHeight* 32
        x: multipleWidth*181
        y: multipleHeight*245
        border.color: "#DCDCDC"
        radius: multipleWidth* 3
        enabled: {
            if(pop.visible === true){
                return false
            }
            return !currentMstart
        }
        TextInput {
            id: batchsizedata
            width: multipleWidth* 80
            height: multipleHeight* 32
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth*20
            focus: true
            clip: true
            autoScroll:true
            text: currentBatchSize
            font.family: fregular.name
            property bool textStatus: false
            validator: RegExpValidator{
                regExp:/^[0-9]\d{0,5}/
            }
            Component.onCompleted: {
                textStatus = true
            }
            onTextChanged: {
                if(textStatus === true){
                    if(machinename.currentIndex === productionIndex-1){
                        var tmp = batchSizeStatus()
                        if(tmp === true){
                            if(pop.visible === true){
                                console.log(tmp)
                                tmp = false
                            }
                            if(currentMstart === true){
                                tmp = false
                            }
                        }
                        savebtn.batchSizeChange = tmp
                    }
                }
            }
        }
    }
    function batchSizeStatus(){
        if(machinename.currentIndex === 0){
            if(batchsizedata.text !== opcua.mBatchSize1){
                return true
            }
            else{
                return false
            }
        }
        else if(machinename.currentIndex === 1){
            if(batchsizedata.text !== opcua.mBatchSize2){
                return true
            }
            else{
                return false
            }
        }
        else if(machinename.currentIndex === 2){
            if(batchsizedata.text !== opcua.mBatchSize3){
                return true
            }
            else{
                return false
            }
        }
        else if(machinename.currentIndex === 3){
            if(batchsizedata.text !== opcua.mBatchSize4){
                return true
            }
            else{
                return false
            }
        }
    }

    RoundButton{
        id: savebtn
        width: multipleWidth*80
        height: multipleHeight* 30
        text: "Save"
        x: multipleWidth*299
        y: multipleHeight*247
        background: Rectangle{
            color: savebtn.enabled === true ? savebtn.pressed ?"#215476" :"#3D7AB3" : "#9A9A9A"
            radius: multipleWidth* 5
        }
        contentItem: Text {
            text: parent.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: multipleWidth* 14
            font.family: fregular.name
        }
        property bool batchSizeChange: false
        enabled: batchSizeChange
        onClicked: {
            batchSizeChange = false
            if(machinename.currentIndex === 0){
                opcua.setBatchSize1(text)
            }
            else if(machinename.currentIndex === 1){
                opcua.setBatchSize2(text)
            }
            else if(machinename.currentIndex === 2){
                opcua.setBatchSize3(text)
            }
            else if(machinename.currentIndex === 3){
                opcua.setBatchSize4(text)
            }
            opcua.updateBatchSize(machinename.currentIndex, batchsizedata.text)
            ConfigurationQml.updateBatchSize(productionIndex,batchsizedata.text)
        }
    }


    Rectangle{
        id: machine
        width: multipleWidth* 620
        height: multipleHeight* 360
        radius: multipleWidth* 5
        x: multipleWidth*60
        y: multipleHeight*337
        border.color: "#BBBBBB"
        enabled: pop.visible === true ? false : true
        Text {
            id: machineinfor
            x: multipleWidth*31
            y: multipleHeight*27
            width: multipleWidth* 157
            height: multipleHeight* 28
            text: qsTr("3# MW-XA-3 [EP]")
            font.family: fregular.name
            color: "#3D7AB3"
            font.pixelSize: multipleWidth* 20
            Component.onCompleted: {
                ConfigurationQml.selectMachName(machinename.currentIndex+1)
            }
        }


        Rectangle{
            id: readyrect
            width: multipleWidth* 86
            height: multipleHeight* 20
            x: multipleWidth*36
            y: multipleHeight*109
            radius: multipleWidth* 10
            color: {
                if(machinename.currentIndex === 0){
                    if(opcua.mReady1 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 1){
                    if(opcua.mReady2 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 2){
                    if(opcua.mReady3 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 3){
                    if(opcua.mReady4 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
            }

        }

        Text {
            id: readyrectname
            width: multipleWidth* 52
            height: multipleHeight* 25
            x: multipleWidth*52
            y: multipleHeight*139
            text: qsTr("Ready")
            font.family: fregular.name
            font.pixelSize: multipleWidth* 18
        }


        Rectangle{
            id: datareadyrect
            width: multipleWidth* 86
            height: multipleHeight* 20
            x: multipleWidth*152
            y: multipleHeight*109
            radius: multipleWidth* 10
            color:{
                if(machinename.currentIndex === 0){
                    if(opcua.mDataReady1 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 1){
                    if(opcua.mDataReady2 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 2){
                    if(opcua.mDataReady3 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 3){
                    if(opcua.mDataReady4 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
            }
        }

        Text {
            id: datareadyrectname
            x: multipleWidth*147
            y: multipleHeight*139
            width: multipleWidth* 96
            height: multipleHeight* 25
            text: qsTr("Data Ready")
            font.family: fregular.name
            font.pixelSize: multipleWidth* 18
        }


        Rectangle{
            id: sonicsrect
            width: multipleWidth* 86
            height: multipleHeight* 20
            x: multipleWidth*36
            y: multipleHeight*184
            radius: multipleWidth* 10
            color:{
                if(machinename.currentIndex === 0){
                    if(opcua.mSonics1 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 1){
                    if(opcua.mSonics2 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 2){
                    if(opcua.mSonics3 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 3){
                    if(opcua.mSonics4 === false){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
            }
        }
        Text {
            id: sonicsrectname
            x: multipleWidth*53
            y: multipleHeight*214
            width: multipleWidth* 54
            height: multipleHeight* 25
            text: qsTr("Sonics")
            font.family: fregular.name
            font.pixelSize: multipleWidth* 18
        }

        Rectangle{
            id: dataalarmrect
            width: multipleWidth* 86
            height: multipleHeight* 20
            x: multipleWidth*152
            y: multipleHeight*184
            radius: multipleWidth* 10
            color: "#9A9A9A"
        }
        Text {
            id: dataalarmrectname
            x: multipleWidth*148
            y: multipleHeight*214
            width: multipleWidth* 95
            height: multipleHeight* 25
            text: qsTr("Data Alarm")
            font.family: fregular.name
            font.pixelSize: multipleWidth* 18
        }


        Rectangle{
            id: alarmrect
            width: multipleWidth* 86
            height: multipleHeight* 20
            x: multipleWidth*36
            y: multipleHeight*259
            radius: multipleWidth* 10
            color:{
                if(machinename.currentIndex === 0){
                    if(opcua.mAlarm1 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#BD3124"
                    }
                }
                else if(machinename.currentIndex === 1){
                    if(opcua.mAlarm2 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#BD3124"
                    }
                }
                else if(machinename.currentIndex === 2){
                    if(opcua.mAlarm3 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#BD3124"
                    }
                }
                else if(machinename.currentIndex === 3){
                    if(opcua.mAlarm4 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#BD3124"
                    }
                }

            }
        }
        Text {
            id: alarmrectname
            x: multipleWidth*54
            y: multipleHeight*289
            width: multipleWidth* 51
            height: multipleHeight* 25
            text: qsTr("Alarm")
            font.family: fregular.name
            font.pixelSize: multipleWidth* 18
        }
        RoundButton{
            id: resetbtn
            width: multipleWidth* 80
            height: multipleHeight* 30
            text: "Reset"
            x: multipleWidth*400
            y: multipleHeight*27
            background: Rectangle{
                color: resetbtn.pressed ?"#215476" :"#3D7AB3";
                radius: multipleWidth* 5
            }
            contentItem: Text {
                text: parent.text
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: multipleWidth* 14
                font.family: fregular.name
            }
            onClicked: {
                opcua.updateReset(machinename.currentIndex, 1)
                timer1.start()
            }
            visible: {
                if(manual.checked === true || auto.checked === true){
                    if(machinename.currentIndex === 0){
                        if(opcua.mAlarm1 === 0){
                            return false
                        }
                        else{
                            return true
                        }
                    }
                    else if(machinename.currentIndex === 1){
                        if(opcua.mAlarm2 === 0){
                            return false
                        }
                        else{
                            return true
                        }
                    }
                    else if(machinename.currentIndex === 2){
                        if(opcua.mAlarm3 === 0){
                            return false
                        }
                        else{
                            return true
                        }
                    }
                    else if(machinename.currentIndex === 3){
                        if(opcua.mAlarm4 === 0){
                            return false
                        }
                        else{
                            return true
                        }
                    }
                }
                else if(merecycle.checked === true){
                    if(machinename.currentIndex === 0){
                        if(opcua.mAlarm1 === 2){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                    else if(machinename.currentIndex === 1){
                        if(opcua.mAlarm2 === 2){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                    else if(machinename.currentIndex === 2){
                        if(opcua.mAlarm3 === 2){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                    else if(machinename.currentIndex === 3){
                        if(opcua.mAlarm4 === 2){
                            return true
                        }
                        else{
                            return false
                        }
                    }
                }
                else{
                    false
                }
            }
        }

        RoundButton{
            id: stopbtn
            width: multipleWidth* 80
            height: multipleHeight* 30
            text:{
                if(machinename.currentIndex === 0){
                    if(opcua.mStart1 === true){
                        return "Stop"
                    }
                    else{
                        return "Start"
                    }
                }
                else if(machinename.currentIndex === 1){
                    if(opcua.mStart2 === true){
                        return "Stop"
                    }
                    else{
                        return "Start"
                    }
                }
                else if(machinename.currentIndex === 2){
                    if(opcua.mStart3 === true){
                        return "Stop"
                    }
                    else{
                        return "Start"
                    }
                }
                else if(machinename.currentIndex === 3){
                    if(opcua.mStart4 === true){
                        return "Stop"
                    }
                    else{
                        return "Start"
                    }
                }
                else{
                    return "Start"
                }
            }
            x: multipleWidth*510
            y: multipleHeight*27
            background: Rectangle{
                color: stopbtn.pressed ?"#215476" :"#3D7AB3";
                radius: multipleWidth* 5
            }
            contentItem: Text {
                text: parent.text
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: multipleWidth* 14
                font.family: fregular.name
            }
            onClicked: {
                var starttime = new Date()
                if(text === "Start"){
                    var tmp
                    if(machinename.currentIndex === 0){
                        tmp = opcua.getReady1()
                    }
                    else if(machinename.currentIndex === 1){
                        tmp = opcua.getReady2()
                    }
                    else if(machinename.currentIndex === 2){
                        tmp = opcua.getReady3()
                    }
                    else if(machinename.currentIndex === 3){
                        tmp = opcua.getReady4()
                    }
                    if(tmp === true){
                        batchsizedata.text = currentBatchSize
                        savebtn.batchSizeChange = false
                        if(machinename.currentIndex === 0){
                            if(opcua.cycleCounter1() === 0){
                                opcua.resetData()
                                startTimeData = starttime
                                stime.text = starttime.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd hh:mm:ss")
                                initTime = stime.text
                                etime.text = "N/A"
                                if(manual.checked === true){
                                    moder.text = manual.text
                                }
                                else if(auto.checked === true){
                                    moder.text = auto.text
                                }
                                else if(merecycle.checked === true){
                                    moder.text = merecycle.text
                                }
                                opcua.updateStart(machinename.currentIndex, 1)
                                if(manual.checked === true){
                                    timer.start()
                                }
                            }
                            else{
                                if(manual.checked === true || modeStatus === true){
                                    newStart()
                                }
                                else{
                                    pop.visible = true
                                }
                            }
                        }
                        else if(machinename.currentIndex === 1){
                            if(opcua.cycleCounter2() === 0){
                                opcua.resetData()
                                startTimeData = starttime
                                stime.text = starttime.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd hh:mm:ss")
                                initTime = stime.text
                                etime.text = "N/A"
                                if(manual.checked === true){
                                    moder.text = manual.text
                                }
                                else if(auto.checked === true){
                                    moder.text = auto.text
                                }
                                else if(merecycle.checked === true){
                                    moder.text = merecycle.text
                                }
                                opcua.updateStart(machinename.currentIndex, 1)
                                if(manual.checked === true){
                                    timer.start()
                                }
                            }
                            else{
                                if(manual.checked === true || modeStatus === true){
                                    newStart()
                                }
                                else{
                                    pop.visible = true
                                }
                            }
                        }
                        else if(machinename.currentIndex === 2){
                            if(opcua.cycleCounter3() === 0){
                                opcua.resetData()
                                startTimeData = starttime
                                stime.text = starttime.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd hh:mm:ss")
                                initTime = stime.text
                                etime.text = "N/A"
                                if(manual.checked === true){
                                    moder.text = manual.text
                                }
                                else if(auto.checked === true){
                                    moder.text = auto.text
                                }
                                else if(merecycle.checked === true){
                                    moder.text = merecycle.text
                                }
                                opcua.updateStart(machinename.currentIndex, 1)
                                if(manual.checked === true){
                                    timer.start()
                                }
                            }
                            else{
                                if(manual.checked === true || modeStatus === true){
                                    newStart()
                                }
                                else{
                                    pop.visible = true
                                }
                            }
                        }
                        else if(machinename.currentIndex === 3){
                            if(opcua.cycleCounter4() === 0){
                                opcua.resetData()
                                startTimeData = starttime
                                stime.text = starttime.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd hh:mm:ss")
                                initTime = stime.text
                                etime.text = "N/A"
                                if(manual.checked === true){
                                    moder.text = manual.text
                                }
                                else if(auto.checked === true){
                                    moder.text = auto.text
                                }
                                else if(merecycle.checked === true){
                                    moder.text = merecycle.text
                                }
                                opcua.updateStart(machinename.currentIndex, 1)
                                if(manual.checked === true){
                                    timer.start()
                                }
                            }
                            else{
                                if(manual.checked === true || modeStatus === true){
                                    newStart()
                                }
                                else{
                                    pop.visible = true
                                }
                            }
                        }
                        modeStatus = false
                    }
                }
                else{
                    opcua.updateStart(machinename.currentIndex, 0)
                    opcua.updateReset(machinename.currentIndex, 1)
                    timer2.start()
                }
            }
        }
        Rectangle{
            id: machinedetails
            width: multipleWidth* 302
            height: multipleHeight* 221
            x: multipleWidth*288
            y: multipleHeight*94
            radius: multipleWidth* 5
            border.color: "#BBBBBB"
            Text {
                id: starttime
                x: multipleWidth*14
                y: multipleHeight*10
                width: multipleWidth* 86
                height: multipleHeight* 25
                text: qsTr("Start Time")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: endtime
                x: multipleWidth*14
                y: multipleHeight*45
                width: multipleWidth* 79
                height: multipleHeight* 25
                text: qsTr("End Time")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: alreadyrun
                x: multipleWidth*14
                y: multipleHeight*80
                width: multipleWidth* 102
                height: multipleHeight* 25
                text: qsTr("Already Run")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: mode
                x: multipleWidth*14
                y: multipleHeight*115
                width: multipleWidth* 49
                height: multipleHeight* 25
                text: qsTr("Mode")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: ppm
                x: multipleWidth*14
                y: multipleHeight*150
                width: multipleWidth* 38
                height: multipleHeight* 25
                text: qsTr("PPM")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 18
            }
            Text {
                id: alarmnum
                x: multipleWidth*14
                y: multipleHeight*185
                width: multipleWidth* 125
                height: multipleHeight* 25
                font.family: fregular.name
                text: qsTr("Alarm Number")
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: stime
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: multipleWidth*11
                anchors.rightMargin: multipleWidth*13
                width: multipleWidth* 141
                height: multipleHeight* 23
                text: qsTr("N/A")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 16
                horizontalAlignment: Text.AlignRight
            }

            Text {
                id: etime
                anchors.right: stime.right
                anchors.top: stime.bottom
                anchors.topMargin: multipleWidth*12
                width: multipleWidth* 141
                height: multipleHeight* 23
                text: qsTr("N/A")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 16
                horizontalAlignment: Text.AlignRight
            }

            Text {
                id: arun
                anchors.right: stime.right
                anchors.top: etime.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text:{
                    if(machinename.currentIndex === 0){
                        return opcua.mCycleCounter1
                    }
                    else if(machinename.currentIndex === 1){
                        return opcua.mCycleCounter2
                    }
                    else if(machinename.currentIndex === 2){
                        return opcua.mCycleCounter3
                    }
                    else if(machinename.currentIndex === 3){
                        return opcua.mCycleCounter4
                    }
                }
                font.family: fregular.name
                font.pixelSize: multipleWidth* 16
            }
            Text {
                id: moder
                anchors.right: stime.right
                anchors.top: arun.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: qsTr("")
                font.family: fregular.name
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: ppmnum
                anchors.right: stime.right
                anchors.top: moder.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: {
                    if(machinename.currentIndex === 0){
                        return opcua.mPPM1
                    }
                    else if(machinename.currentIndex === 1){
                        return opcua.mPPM2
                    }
                    else if(machinename.currentIndex === 2){
                        return opcua.mPPM3
                    }
                    else if(machinename.currentIndex === 3){
                        return opcua.mPPM4
                    }
                }
                font.family: fregular.name
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: anum
                anchors.right: ppmnum.right
                anchors.top: ppmnum.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text:{
                    if(machinename.currentIndex === 0){
                        return opcua.mAlarmNumber1
                    }
                    else if(machinename.currentIndex === 1){
                        return opcua.mAlarmNumber2
                    }
                    else if(machinename.currentIndex === 2){
                        return opcua.mAlarmNumber3
                    }
                    else if(machinename.currentIndex === 3){
                        return opcua.mAlarmNumber4
                    }
                }
                font.family: fregular.name
                font.pixelSize: multipleWidth* 16
            }
        }
    }
    Rectangle{
        id: pop
        width: multipleWidth* 620
        height: multipleHeight* 360
        radius: multipleWidth* 5
        x: multipleWidth*60
        y: multipleHeight*337
        opacity: 0.5
        color: "#BBBBBB"
        visible: false
        onVisibleChanged: {
            if(visible === true){
                savebtn.batchSizeChange = false
            }
        }
    }

    RoundButton{
        id: e_stop
        width: multipleWidth*200
        height: multipleHeight*200
        x: multipleWidth*270
        y: multipleHeight*418
        text: "E-STOP"
        background: Rectangle{
            color: "#3D7AB3"
            radius: multipleWidth*101
        }
        contentItem: Text {
            text: parent.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: multipleWidth* 18
            font.family: fregular.name
        }
        visible:{
            if(pop.visible === true && currentEstop === false){
                return true
            }
            else{
                return false
            }
        }
    }

    Rectangle {
        id: dig
        width:multipleWidth* 360
        height:multipleHeight* 184
        x:multipleWidth* 190
        y:multipleHeight* 419
        border.color: "#3D7AB3"
        radius: multipleWidth*5
        color: "#FFFFFF"
        opacity: 1
        visible: pop.visible === true && currentEstop === true && e_StopStatus === false ? true : false
        enabled: visible === true ? true : false
        Text {
            text: qsTr("Continue with the last run task\n or start a new run task?")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize:multipleWidth* 20
            anchors.top: parent.top
            anchors.topMargin:multipleWidth* 35
            font.family: fregular.name
        }

        RoundButton{
            id: come
            width:multipleWidth* 154
            height:multipleHeight* 32
            radius:multipleWidth* 5
            x:multipleWidth* 24
            y:multipleHeight* 129
            text: "Continue Run"
            visible: {
                if(pop.visible === true){
                    if(machinename.currentIndex === 0){
                        return opcua.mEstop1
                    }
                    else if(machinename.currentIndex === 1){
                        return opcua.mEstop2
                    }
                    else if(machinename.currentIndex === 2){
                        return opcua.mEstop3
                    }
                    else if(machinename.currentIndex === 3){
                        return opcua.mEstop4
                    }
                }
                else{
                    return false
                }
            }
            background: Rectangle{
                color: come.pressed ?"#215476" :"#3D7AB3";
                radius: multipleWidth* 5
            }
            contentItem: Text {
                text: parent.text
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: multipleWidth* 15
                font.family: fregular.name
            }
            onClicked: {
                if(manual.checked === true){
                    moder.text = manual.text
                }
                else if(auto.checked === true){
                    moder.text = auto.text
                }
                else if(merecycle.checked === true){
                    moder.text = merecycle.text
                }
                //                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                etime.text = ""
                opcua.updateStart(machinename.currentIndex, 1)
                if(manual.checked === true){
                    timer.start()
                }
                pop.visible = false
            }
        }
        RoundButton{
            id: news
            width:multipleWidth* 154
            height:multipleHeight* 32
            radius:multipleWidth* 5
            x:multipleWidth* 182
            y:multipleHeight* 129
            text: "Start New Task"
            background: Rectangle{
                color:  news.pressed ?"#215476" :"#3D7AB3";
                radius: multipleWidth* 5
            }
            contentItem: Text {
                text: parent.text
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: multipleWidth* 15
                font.family: fregular.name
            }
            visible: {
                if(pop.visible === true){
                    if(machinename.currentIndex === 0){
                        return opcua.mEstop1
                    }
                    else if(machinename.currentIndex === 1){
                        return opcua.mEstop2
                    }
                    else if(machinename.currentIndex === 2){
                        return opcua.mEstop3
                    }
                    else if(machinename.currentIndex === 3){
                        return opcua.mEstop4
                    }
                }
                else{
                    return false
                }
            }
            onClicked: {
                opcua.resetData()
                opcua.updateCycleCounter(machinename.currentIndex,0)
                opcua.updateAlarmNumber(machinename.currentIndex,0)
                if(manual.checked === true){
                    moder.text = manual.text
                }
                else if(auto.checked === true){
                    moder.text = auto.text
                }
                else if(merecycle.checked === true){
                    moder.text = merecycle.text
                }
                startTimeData = new Date()
                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                initTime = stime.text
                etime.text = "N/A"
                opcua.updateStart(machinename.currentIndex, 1)
                if(manual.checked === true){
                    timer.start()
                }
                pop.visible = false
            }
        }
    }

    RoundButton{
        id:estop
        radius: multipleWidth* 5
        height: multipleHeight* 30
        width: currentEstop === true ? multipleWidth* 80 : 120 * multipleWidth
        x: currentEstop === true ? multipleWidth* 1222 : 1182 * multipleWidth
        y: multipleHeight*37
        background: Rectangle{
            border.color: "#BD3124"
            color: estop.pressed ?"#000000" :"#FFF81D";
            radius: multipleWidth* 5
        }
        contentItem: Text {
            text: currentEstop === true ? "E-Stop" : "E-Stop Reset"
            color: "#BD3124"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: multipleWidth* 20
            font.family: fregular.name
        }
        onPressed: {
            if(currentEstop === true){
                e_StopStatus = true
                opcua.updateEstop(machinename.currentIndex,0)
                if(currentMstart === true){
                    opcua.updateStart(machinename.currentIndex, 0)
                    opcua.updateReset(machinename.currentIndex, 1)
                    if(stime.text === "N/A"){
                        var starttime = new Date()
                        startTimeData = starttime
                        stime.text = starttime.toLocaleString(Qt.locale("de_DE"), "yyyy-MM-dd hh:mm:ss")
                        initTime = stime.text
                    }
                    timer2.start()
                }
                pop.visible = true
            }
            else{
                e_StopStatus = false
                pop.visible = false
                opcua.updateEstop(machinename.currentIndex,1)
            }
        }
    }
    RoundButton{
        id:back
        radius: multipleWidth* 5
        height: multipleHeight* 30
        width: multipleWidth* 80
        x: multipleWidth*1332
        y: multipleHeight*37
        text: "Back"
        background: Rectangle{
            color: back.pressed ?"#215476" :"#3D7AB3";
            radius: multipleWidth* 5
        }
        contentItem: Text {
            text: parent.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: multipleWidth* 14
            font.family: fregular.name
        }
    }
    Text {
        id: plc
        width: multipleWidth* 85
        height: multipleHeight* 28
        x: multipleWidth*1018
        y: multipleHeight*114
        text: qsTr("PLC Data")
        font.family: fregular.name
        font.pixelSize: multipleWidth* 20
    }
    SwitchGroup.TableView {
        id: plcTable
        width: multipleWidth* 660
        height: multipleHeight* 120
        x: multipleWidth*738
        y: multipleHeight*157
        enabled: false
        horizontalScrollBarPolicy: multipleHeight* Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: multipleHeight* Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
        SwitchGroup.TableViewColumn {
            id: p1
            role: "name"
            title: ""
            width: multipleWidth* 125
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p2
            role: "fmin"
            title: "Min"
            width: multipleWidth* 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p3
            role: "fcurrent"
            title: "Current"
            width: multipleWidth* 67
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p4
            role: "fmax"
            title: "Max"
            width: multipleWidth* 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p5
            role: "mname"
            title: ""
            width: multipleWidth* 125
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p6
            role: "mmin"
            title: "Min"
            width: multipleWidth* 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p7
            role: "mcurrent"
            title: "Current"
            width: multipleWidth* 67
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p8
            role: "mmax"
            title: "Max"
            width: multipleWidth* 65
            resizable:false
        }
        headerDelegate: Rectangle{
            id: header
            height: multipleHeight* 30
            color: "#F2F2F2"
            Text {
                id: headerName
                text: styleData.value
                font.pixelSize: multipleWidth* 18
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.family: fregular.name
            }
        }
        rowDelegate: Rectangle{
            id:rowRectangle
//            color:styleData.row % 2 == 0 ? "#FFFFFF" : "#F2F2F2"
            color:"#FFFFFF"
            height: multipleHeight* 30
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            id: item
            text: {
                if(styleData.row === 2 && (styleData.column === 1 || styleData.column === 3
                                           || styleData.column === 4
                                           || styleData.column === 5
                                           || styleData.column === 6
                                           || styleData.column === 7)){
                    return ""
                }
                else{
                    return styleData.value
                }
            }
            font.family: fregular.name
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            property double wid: plcTable.width
        }
        model: ListModel {
            id: plcModel
            property int power: currentPower
            property int powermin: mincurrentPower
            property int powermax: maxcurrentPower
            property int tune: currentTune
            property int tunemin: mincurrentTune
            property int tunemax: maxcurrentTune
            property int fre: currentFre
            property int fremin: mincurrentFre
            property int fremax: maxcurrentFre
            property int amp: currentAmp
            property int ampmin: mincurrentAmp
            property int ampmax: maxcurrentAmp
            property int count: cycleCounter
            property int countmin: 0
            property int countmax: 0
            property bool modelStatus: false
            Component.onCompleted: {
                plcModel.append({name: "Power", fmin: powermin,fcurrent: power,fmax: powermax,mname:"Tune",mmin: tunemin,mcurrent:tune,mmax: tunemax})
                plcModel.append({name: "Freq-offset",fmin: fremin,fcurrent:fre,fmax: fremax,mname:"Amplitude",mmin: ampmin,mcurrent:amp,mmax: ampmax})
                plcModel.append({name: "Counter",fmin: "",fcurrent:count,fmax: "",mname:"",mmin: "",mcurrent:"",mmax: ""})
            }
            onPowerChanged: {
                setProperty(0, "fcurrent", power)
            }
            onPowermaxChanged: {
                setProperty(0, "fmax", powermax)
            }
            onPowerminChanged: {
                setProperty(0, "fmin", powermin)
            }
            onTuneChanged: {
                setProperty(0, "mcurrent", tune)
            }
            onTunemaxChanged: {
                setProperty(0, "mmax", tune)
            }
            onTuneminChanged: {
                setProperty(0, "mmin", tune)
            }
            onFreChanged: {
                setProperty(1, "fcurrent", fre)
            }
            onFremaxChanged: {
                setProperty(1, "fmax", fremax)
            }
            onFreminChanged: {
                setProperty(1, "fmin", fremin)
            }
            onAmpChanged: {
                setProperty(1, "mcurrent", amp)
            }
            onAmpmaxChanged: {
                setProperty(1, "mmax", ampmax)
            }
            onAmpminChanged: {
                setProperty(1, "mmin", ampmin)
            }
            onCountChanged: {
                setProperty(2, "fcurrent", count)
            }
        }
        focus: true
    }
    Text {
        id: machinedata
        x: multipleWidth*996
        y: multipleHeight*304
        width: multipleWidth* 129
        height: multipleHeight* 28
        text: qsTr("Machine Data")
        font.family: fregular.name
        font.pixelSize: multipleWidth* 20
    }

    SwitchGroup.TableView {
        id: machinedataTable
        width: multipleWidth* 690
        height: multipleHeight* 330
        x: multipleWidth*725
        y: multipleHeight*347
        horizontalScrollBarPolicy: multipleHeight* Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: multipleHeight* Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
        enabled: false
        SwitchGroup.TableViewColumn {
            id:a1
            role: "name1"
            title: ""
            width: multipleWidth* 225
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id:a2
            role: "name2"
            title: ""
            width: multipleWidth* 115
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id:a3
            role: "name3"
            title: ""
            width: multipleWidth* 220
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id:a4
            role: "name4"
            title: ""
            width: multipleWidth* 115
            resizable:false
        }
        headerDelegate: Rectangle{
            height: multipleHeight*1
        }
        rowDelegate: Rectangle{
            id:rowRectangle1
//            color:styleData.row % 2 == 0 ? "#F2F2F2" : "#FFFFFF"
            color:"#FFFFFF"
            height: multipleHeight* 30
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            id: item1
            text: {
                if((styleData.row === 2 || styleData.row === 5) && styleData.column === 3){
                    return ""
                }
                else{
                    return styleData.value
                }
            }
            font.family: fregular.name
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            property double wid: machinedataTable.width
        }
        model: ListModel {
            id: machinedataModel
            property int ampsetting: mAmpSetting
            property int engerysetting: mEnergySetting
            property int tpsetting: mTPressureSetting
            property int wpsetting: mWPressureSetting
            property int wmsetting: mWeldMode
            property int awtsetting: mWeldTime
            property int awesetting: mWeldEngery
            property int appsetting: mWeakPower
            property int aphsetting: mPreHeight
            property int aposetting: mPostHeight
            property int qtusetting: mMaxWeldTime
            property int qtlsetting: mMinWeldTime
            property int qpusetting: mMaxPower
            property int qplsetting: mMinPower
            property int qphusetting: mMaxPreHeight
            property int qphlsetting: mMinPreHeight
            property int qpousetting: mMaxPostHeight
            property int qpolsetting: mMinPostHeight
            property int malarm: mAlarm
            property int mcount: mCycleCounter
            Component.onCompleted: {
                machinedataModel.append({name1: "Amplitude Setting",name2: ampsetting,name3: "Engery Setting",name4: engerysetting})
                machinedataModel.append({name1: "Trigger Pressure Setting",name2: tpsetting,name3: "Weld Pressure Setting",name4: wpsetting})
                machinedataModel.append({name1: "Weld Mode Setting",name2: wmsetting,name3: "",name4: ""})
                machinedataModel.append({name1: "Actual Weld Time",name2: awtsetting,name3: "Actual Weld Engery",name4: awesetting})
                machinedataModel.append({name1: "Actual Peak Power",name2: appsetting,name3: "Actual Pre-Height",name4: aphsetting})
                machinedataModel.append({name1: "Actual Post-Height",name2: aposetting,name3: "",name4: ""})
                machinedataModel.append({name1: "Quality Time Upper",name2: qtusetting,name3: "Quality Time Lower",name4: qtlsetting})
                machinedataModel.append({name1: "Quality Power Upper",name2: qpusetting,name3: "Quality Power Lower",name4: qplsetting})
                machinedataModel.append({name1: "Quality Per-Height Upper",name2: qphusetting,name3: "Quality Per-Height Lower",name4: qphlsetting})
                machinedataModel.append({name1: "Quality Post-Height Upper",name2: qpousetting,name3: "Quality Post-Height Lower",name4: qpolsetting})
                machinedataModel.append({name1: "AlarmFlag",name2: malarm,name3: "Counter",name4: mcount})
            }

            onAmpsettingChanged: {
                setProperty(0, "name2", ampsetting)
            }
            onEngerysettingChanged: {
                setProperty(0, "name4", engerysetting)
            }
            onTpsettingChanged: {
                setProperty(1, "name2", tpsetting)
            }
            onWpsettingChanged: {
                setProperty(1, "name4", wpsetting)
            }
            onWmsettingChanged: {
                setProperty(2, "name2", wmsetting)
            }
            onAwtsettingChanged: {
                setProperty(3, "name2", awtsetting)
            }
            onAwesettingChanged: {
                setProperty(3, "name4", awesetting)
            }
            onAppsettingChanged: {
                setProperty(4, "name2", appsetting)
            }
            onAphsettingChanged: {
                setProperty(4, "name4", aphsetting)
            }
            onAposettingChanged: {
                setProperty(5, "name2", aposetting)
            }
            onQtusettingChanged: {
                setProperty(6, "name2", qtusetting)
            }
            onQtlsettingChanged: {
                setProperty(6, "name4", qtlsetting)
            }
            onQpusettingChanged: {
                setProperty(7, "name2", qpusetting)
            }
            onQplsettingChanged: {
                setProperty(7, "name4", qplsetting)
            }
            onQphusettingChanged: {
                setProperty(8, "name2", qphusetting)
            }
            onQphlsettingChanged: {
                setProperty(8, "name4", qphlsetting)
            }
            onQpousettingChanged: {
                setProperty(9, "name2", qpousetting)
            }
            onQpolsettingChanged: {
                setProperty(9, "name4", qpolsetting)
            }
            onMalarmChanged: {
                setProperty(10, "name2", malarm)
            }
            onMcountChanged: {
                setProperty(10, "name4", mcount)
            }
        }
        focus: true
    }
    Text {
        id: batchSizeAlarm
        text: qsTr("Batch Size Met.")
        font.family: fregular.name
        font.pixelSize:multipleWidth* 20
        color: "#BD3124"
        width:multipleWidth* 142
        height: multipleHeight*28
        x:multipleWidth* 60
        y: multipleHeight*717
        visible:{
            if(machinename.currentIndex === 0){
                if(opcua.mAlarm1 === 2){
                    return true
                }
                else{
                    return false
                }
            }
            else if(machinename.currentIndex === 1){
                if(opcua.mAlarm2 === 2){
                    return true
                }
                else{
                    return false
                }
            }
            else if(machinename.currentIndex === 2){
                if(opcua.mAlarm3 === 2){
                    return true
                }
                else{
                    return false
                }
            }
            else if(machinename.currentIndex === 3){
                if(opcua.mAlarm4 === 2){
                    return true
                }
                else{
                    return false
                }
            }
        }
    }
}
