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
    property bool batchSizeChange: false
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
    Component.onCompleted: {
        if(productionIndex === 1){
            batchsizedata.text = opcua.batchSize1()
        }
        else if(productionIndex === 2){
            batchsizedata.text = opcua.batchSize2()
        }
        else if(productionIndex === 3){
            batchsizedata.text = opcua.batchSize3()
        }
        else if(productionIndex === 4){
            batchsizedata.text = opcua.batchSize4()
        }
        batchSizeChange = true
    }

    Connections{
        target:ConfigurationQml
        function onSigMachName(list){
            machineinfor.text = list[0]
            currentIp = list[1]
            currentPort = list[2]
        }
    }
    Connections{
        target:opcuaCache
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
            etime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
        }
    }
    Text {
        id: machineselected
        x: multipleWidth*60
        y: multipleHeight*37
        width: multipleWidth* 164
        height: multipleHeight* 28
        text: qsTr("Machine Selected")
        color: "#000000"
        font.pixelSize: multipleWidth* 20
    }
    ComboBox{
        id: machinename
        width: multipleWidth* 100
        height: multipleHeight* 32
        x: multipleWidth*259
        y: multipleHeight*35
        font.pixelSize: multipleWidth*20
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
            x: multipleWidth* machinename.width - width - machinename.rightPadding
            y: multipleHeight* machinename.topPadding + (machinename.availableHeight - height) / 2
            width: multipleWidth* 16
            height: multipleHeight* 16
            source: "qrc:/images/user.png"
        }
        onActivated: {
            productionIndex = currentIndex + 1
            ConfigurationQml.selectMachName(currentIndex+1)
            opcuaCache.initProduction(productionIndex)
            if(productionIndex === 1){
                batchsizedata.text = opcua.batchSize1()
            }
            else if(productionIndex === 2){
                batchsizedata.text = opcua.batchSize2()
            }
            else if(productionIndex === 3){
                batchsizedata.text = opcua.batchSize3()
            }
            else if(productionIndex === 4){
                batchsizedata.text = opcua.batchSize4()
            }
            savebtn.checked = false
            plcTable.upDate()
        }
        Component.onCompleted: {
            currentIndex = productionIndex - 1
        }
    }
    Rectangle{
        id:switchradio
        x: multipleWidth*55
        y: multipleHeight*122
        width: multipleWidth* 389
        height: multipleHeight* 33
        Component.onCompleted: {
            opcuaCache.initProduction(productionIndex)
        }

        RadioButton{
            id: manual
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text: "Manual"
            spacing: 10
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
            }
            onReleased: {
                opcua.updateAlarmLock(machinename.currentIndex,0)
                opcua.updateMode(machinename.currentIndex, 0)
                opcuaCache.updateMode(productionIndex, 0)
                opcuaCache.updateAlarmLock(productionIndex, 0)
                currentMode = 0
            }
        }
        RadioButton{
            id: auto
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: manual.right
            anchors.leftMargin: 35
            text: "Auto"
            spacing: 20
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
            }
            onReleased: {
                opcua.updateMode(machinename.currentIndex, 1)
                opcuaCache.updateMode(productionIndex, 1)
                opcuaCache.updateAlarmLock(productionIndex, 0)
                currentMode = 1
            }
        }
        RadioButton{
            id: merecycle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: auto.right
            anchors.leftMargin: 70
            text: "Merecycle"
            spacing: 20
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
            }
            onReleased: {
                opcua.updateAlarmLock(machinename.currentIndex,0)
                opcua.updateMode(machinename.currentIndex, 2)
                opcuaCache.updateMode(productionIndex, 2)
                opcuaCache.updateAlarmLock(productionIndex, 0)
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
        font.pixelSize: multipleWidth* 20
        enabled: auto.checked ? true : false
        onClicked: {
            if(checked === true){
                opcuaCache.updateAlarmLock(productionIndex,1)
                opcua.updateAlarmLock(machinename.currentIndex,1)
            }
            else{
                opcuaCache.updateAlarmLock(productionIndex,0)
                opcua.updateAlarmLock(machinename.currentIndex,0)
            }
        }
    }
    CheckBox{
        id:dataprocessing
        text: " Data Processing"
        x: multipleWidth*270
        y: multipleHeight*185
        width: multipleWidth* 210
        height: multipleHeight* 33
        font.pixelSize: multipleWidth* 20
        enabled: merecycle.checked === true ? false : true
        onReleased: {
            if(checked === false){
                opcua.updateDataReady(machinename.currentIndex,1)
            }
        }
    }
    Text {
        id: batchsize
        width: multipleWidth* 101
        x: multipleWidth*60
        y: multipleHeight*247
        text: qsTr("Batch Size:")
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
        TextInput {
            id: batchsizedata
            width: multipleWidth* 80
            height: multipleHeight* 32
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: multipleWidth*20
            focus: true
            clip: true
            autoScroll:true
            text: machinename.currentIndex === 0 ? opcua.mBatchSize1 : machinename.currentIndex === 1 ? opcua.mBatchSize2
                                                                                                      : machinename.currentIndex === 2 ? opcua.mBatchSize3 : opcua.mBatchSize4
            validator: RegExpValidator{
                regExp:/^[1-9]\d{0,5}/
            }
            Component.onCompleted: {
                savebtn.enabled = false
            }
            onTextChanged: {
                if(batchSizeChange){
                    batchSizeStatus()
                }
            }
        }
    }
    function batchSizeStatus(){
        if(machinename.currentIndex === 0){
            if(batchsizedata.text !== opcua.batchSize1()){
                savebtn.enabled = true
            }
        }
        else if(machinename.currentIndex === 1){
            if(batchsizedata.text !== opcua.batchSize2()){
                savebtn.enabled = true
            }
        }
        else if(machinename.currentIndex === 2){
            if(batchsizedata.text !== opcua.batchSize3()){
                savebtn.enabled = true
            }
        }
        else if(machinename.currentIndex === 3){
            if(batchsizedata.text !== opcua.batchSize4()){
                savebtn.enabled = true
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
        }
        enabled: false
        onClicked: {
            enabled = false
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
            opcuaCache.updateBatchSize(productionIndex,batchsizedata.text)
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
                    if(opcua.mReady1 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 1){
                    if(opcua.mReady2 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 2){
                    if(opcua.mReady3 === 0){
                        return "#9A9A9A"
                    }
                    else{
                        return "#58A55C"
                    }
                }
                else if(machinename.currentIndex === 3){
                    if(opcua.mReady4 === 0){
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
            }
            onClicked: {
                opcua.updateReset(machinename.currentIndex, 1)
            }
            visible: {
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
            }
            onClicked: {
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
                        Tcplient.dis_connect()
                        if(dataprocessing.checked === true){
                            Tcplient.connectTcp(currentIp,currentPort)
                        }
                        if(machinename.currentIndex === 0){
                            if(opcua.cycleCounter1() === 0){
                                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                                etime.text = ""
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
                                pop.visible = true
                            }
                        }
                        else if(machinename.currentIndex === 1){
                            if(opcua.cycleCounter2() === 0){
                                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                                etime.text = ""
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
                                pop.visible = true
                            }
                        }
                        else if(machinename.currentIndex === 1){
                            if(opcua.cycleCounter3() === 0){
                                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                                etime.text = ""
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
                                pop.visible = true
                            }
                        }
                        else if(machinename.currentIndex === 1){
                            if(opcua.cycleCounter4() === 0){
                                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                                etime.text = ""
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
                                pop.visible = true
                            }
                        }


                    }
                }
                else{
                    opcua.updateStart(machinename.currentIndex, 0)
                    opcua.updateReset(machinename.currentIndex, 1)
                    etime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                    if(machinename.currentIndex === 0){
                        runInfo.insertRunInfoData(productionIndex,stime.text,etime.text,opcua.cycleCounter1(),currentMode,opcuaCache.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber1())
                    }
                    else if(machinename.currentIndex === 1){
                        runInfo.insertRunInfoData(productionIndex,stime.text,etime.text,opcua.cycleCounter2(),currentMode,opcuaCache.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber2())
                    }
                    else if(machinename.currentIndex === 2){
                        runInfo.insertRunInfoData(productionIndex,stime.text,etime.text,opcua.cycleCounter3(),currentMode,opcuaCache.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber3())
                    }
                    else if(machinename.currentIndex === 3){
                        runInfo.insertRunInfoData(productionIndex,stime.text,etime.text,opcua.cycleCounter4(),currentMode,opcuaCache.selectAlarmLock(productionIndex),ppmnum.text,opcua.alarmNumber4())
                    }
                    Tcplient.dis_connect()
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
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: endtime
                x: multipleWidth*14
                y: multipleHeight*45
                width: multipleWidth* 79
                height: multipleHeight* 25
                text: qsTr("End Time")
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: alreadyrun
                x: multipleWidth*14
                y: multipleHeight*80
                width: multipleWidth* 102
                height: multipleHeight* 25
                text: qsTr("Already Run")
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: mode
                x: multipleWidth*14
                y: multipleHeight*115
                width: multipleWidth* 49
                height: multipleHeight* 25
                text: qsTr("Mode")
                font.pixelSize: multipleWidth* 18
            }

            Text {
                id: ppm
                x: multipleWidth*14
                y: multipleHeight*150
                width: multipleWidth* 38
                height: multipleHeight* 25
                text: qsTr("PPM")
                font.pixelSize: multipleWidth* 18
            }
            Text {
                id: alarmnum
                x: multipleWidth*14
                y: multipleHeight*185
                width: multipleWidth* 125
                height: multipleHeight* 25
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
                text: qsTr("")
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: etime
                anchors.right: stime.right
                anchors.top: stime.bottom
                anchors.topMargin: multipleWidth*12
                width: multipleWidth* 141
                height: multipleHeight* 23
                text: qsTr("")
                font.pixelSize: multipleWidth* 16
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
                font.pixelSize: multipleWidth* 16
            }
            Text {
                id: moder
                anchors.right: stime.right
                anchors.top: arun.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: qsTr("")
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
        visible: pop.visible === true ? true : false
        enabled: visible === true ? true : false
        Text {
            text: qsTr("Continue with the last run task\n or start a new run task?")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize:multipleWidth* 20
            anchors.top: parent.top
            anchors.topMargin:multipleWidth* 35
        }

        RoundButton{
            id: come
            width:multipleWidth* 154
            height:multipleHeight* 32
            radius:multipleWidth* 5
            x:multipleWidth* 24
            y:multipleHeight* 129
            text: "Continue Run"
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
                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
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
            }
            onClicked: {
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
                stime.text = Qt.formatDateTime(new Date(),"yyyy-MM-dd hh:mm:ss")
                etime.text = ""
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
        width: multipleWidth* 80
        x: multipleWidth*1222
        y: multipleHeight*37
        text: "E-Stop"
        background: Rectangle{
            border.color: "#BD3124"
            color: estop.pressed ?"#000000" :"#FFF81D";
            radius: multipleWidth* 5
        }
        contentItem: Text {
            text: parent.text
            color: "#BD3124"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: multipleWidth* 20
        }
        onPressed: {
            if(text === "E-Stop"){
                text = "E-Stop Reset"
                width = 120 * multipleWidth
                x -= 40 * multipleWidth
            }
            else{
                text = "E-Stop"
                width = 80* multipleWidth
                x += 40* multipleWidth
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
        }
    }
    Text {
        id: plc
        width: multipleWidth* 85
        height: multipleHeight* 28
        x: multipleWidth*1018
        y: multipleHeight*114
        text: qsTr("PLC Data")
        font.pixelSize: multipleWidth* 20
    }
    SwitchGroup.TableView {
        id: plcTable
        width: multipleWidth* 660
        height: multipleHeight* 120
        x: multipleWidth*738
        y: multipleHeight*157

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
        function upDate(){
            plcModel.powermin = currentPower
            plcModel.powermax = currentPower
            plcModel.tunemin = currentTune
            plcModel.tunemax = currentTune
            plcModel.fremin = currentFre
            plcModel.fremax = currentFre
            plcModel.ampmin = currentAmp
            plcModel.ampmax = currentAmp
            plcModel.countmin = cycleCounter
            plcModel.countmax = cycleCounter
        }
        headerDelegate: Rectangle{
            id: header
            height: multipleHeight* 30
            color: "#F2F2F2"
            property double wid: plcTable.width
            Text {
                id: headerName
                text: styleData.value
                font.pixelSize: multipleWidth* 18
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
            }
        }
        rowDelegate: Rectangle{
            id:rowRectangle
            color:styleData.row % 2 == 0 ? "#FFFFFF" : "#F2F2F2"
            height: multipleHeight* 30
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            id: item
            text: {
                if(styleData.value === 0){
                    return ""
                }
                else{
                    return styleData.value
                }
            }
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            property double wid: plcTable.width
        }
        model: ListModel {
            id: plcModel
            property var power: currentPower
            property var powermin
            property var powermax
            property var tune: currentTune
            property var tunemin
            property var tunemax
            property var fre: currentFre
            property var fremin
            property var fremax
            property var amp: currentAmp
            property var ampmin
            property var ampmax
            property var count: cycleCounter
            property var countmin
            property var countmax
            Component.onCompleted: {
                plcModel.append({name: "Power",fmin: powermin,fcurrent: power,fmax: powermax,mname:"Tune",mmin: tunemin,mcurrent:tune,mmax: tunemax})
                plcModel.append({name: "Freq-offset",fmin: fremin,fcurrent:fre,fmax: fremax,mname:"Amplitude",mmin: ampmin,mcurrent:amp,mmax: ampmax})
                plcModel.append({name: "Counter",fmin: countmin,fcurrent:count,fmax: countmax,mname:"",mmin: "",mcurrent:"",mmax: ""})
            }
            onPowerChanged: {
                setProperty(0, "fcurrent", power)
                if(power > powermax){
                    powermax = power
                    setProperty(0, "fmax", powermax)
                }
                if(power < powermin){
                    powermin = power
                    setProperty(0, "fmin", powermin)
                }
            }
            onTuneChanged: {
                setProperty(0, "mcurrent", tune)
                if(tune > tunemax){
                    setProperty(0, "mmax", tune)
                }
                if(tune < tunemin){
                    setProperty(0, "mmin", tune)
                }
            }
            onFreChanged: {
                setProperty(1, "fcurrent", fre)
                if(fre > fremax){
                    setProperty(1, "fmax", fre)
                }
                if(fre < fremin){
                    setProperty(1, "fmin", fre)
                }
            }
            onAmpChanged: {
                setProperty(1, "mcurrent", amp)
                if(amp > ampmax){
                    setProperty(1, "mmax", amp)
                }
                if(amp < ampmin){
                    setProperty(1, "mmin", amp)
                }
            }
            onCountChanged: {
                setProperty(2, "fcurrent", count)
                if(count > countmax){
                    setProperty(0, "fmax", count)
                }
                if(count < countmin){
                    setProperty(0, "fmin", count)
                }
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
        font.pixelSize: multipleWidth* 20
    }

    SwitchGroup.TableView {
        id: machinedataTable
        width: multipleWidth* 690
        height: multipleHeight* 330
        x: multipleWidth*725
        y: multipleHeight*347
        property var wid: machinedataTable.width
        property var hei: machinedataTable.height
        horizontalScrollBarPolicy: multipleHeight* Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: multipleHeight* Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
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
            height: multipleHeight*0
        }
        rowDelegate: Rectangle{
            id:rowRectangle1
            color:styleData.row % 2 == 0 ? "#F2F2F2" : "#FFFFFF"
            height: multipleHeight* 30
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            id: item1
            text: {
                if(styleData.value === 0){
                    return ""
                }
                else{
                    return styleData.value
                }
            }
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            property double wid: machinedataTable.width
        }
        model: ListModel {
            id: machinedataModel
            Component.onCompleted: {
                machinedataModel.append({name1: "Amplitude Setting",name2: "",name3: "Engery Setting",name4: 1})
                machinedataModel.append({name1: "Time Setting",name2: "",name3: "Trigger Pressure Setting",name4: ""})
                machinedataModel.append({name1: "Weld Pressure Setting",name2: "",name3: "Weld Mode Setting",name4: ""})
                machinedataModel.append({name1: "Actual Weld Time",name2: "",name3: "Actual Weld Engery",name4: ""})
                machinedataModel.append({name1: "Actual Peak Power",name2: "",name3: "Actual Pre-Height",name4: ""})
                machinedataModel.append({name1: "Actual Post-Height",name2: "",name3: "",name4: ""})
                machinedataModel.append({name1: "Quality Time Upper",name2: "",name3: "Quality Time Lower",name4: ""})
                machinedataModel.append({name1: "Quality Power Upper",name2: "",name3: "Quality Power Lower",name4: ""})
                machinedataModel.append({name1: "Quality Per-Height Upper",name2: "",name3: "Quality Per-Height Lower",name4: ""})
                machinedataModel.append({name1: "Quality Post-Height Upper",name2: "",name3: "Quality Post-Height Lower",name4: ""})
                machinedataModel.append({name1: "Alarm",name2: "",name3: "Counter",name4: ""})
            }

            //            ListElement {
            //                name1: "Amplitude Setting"
            //                name2: ""
            //                name3: "Engery Setting"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Time Setting"
            //                name2: ""
            //                name3: "Trigger Pressure Setting"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Weld Pressure Setting"
            //                name2: ""
            //                name3: "Weld Mode Setting"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Actual Weld Time"
            //                name2: ""
            //                name3: "Actual Weld Engery"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Actual Peak Power"
            //                name2: ""
            //                name3: "Actual Pre-Height"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Actual Post-Height"
            //                name2: ""
            //                name3: ""
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Quality Time Upper"
            //                name2: ""
            //                name3: "Quality Time Lower"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Quality Power Upper"
            //                name2: ""
            //                name3: "Quality Power Lower"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Quality Per-Height Upper"
            //                name2: ""
            //                name3: "Quality Per-Height Lower"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Quality Post-Height Upper"
            //                name2: ""
            //                name3: "Quality Post-Height Lower"
            //                name4: ""
            //            }
            //            ListElement {
            //                name1: "Alarm"
            //                name2: ""
            //                name3: "Counter"
            //                name4: ""
            //            }
        }
        focus: true
    }
}
