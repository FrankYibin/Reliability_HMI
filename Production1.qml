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
    Connections{
        target:ConfigurationQml
        function onSigMachName(name){
            machineinfor.text = name
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
            ConfigurationQml.selectMachName(currentIndex+1)
        }
    }
    Rectangle{
        id:switchradio
        x: multipleWidth*55
        y: multipleHeight*122
        width: multipleWidth* 389
        height: multipleHeight* 33

        RadioButton{
            id: manual
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text: " Manual"
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
            onClicked: {
                dataprocessing.checked = false
            }
        }
        RadioButton{
            id: auto
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: manual.right
            anchors.leftMargin: 35
            text: " Auto"
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
            onClicked: {
                dataprocessing.checked = false
            }
        }
        RadioButton{
            id: merecycle
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: auto.right
            anchors.leftMargin: 70
            text: " Merecycle"
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
            onClicked: {
                dataprocessing.checked = false
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
            width: multipleWidth* 80
            height: multipleHeight* 32
            anchors.leftMargin: 3
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 20
            focus: true
            clip: true
            autoScroll:true
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
            color: savebtn.pressed ?"#215476" :"#3D7AB3";
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
    Rectangle{
        id: machine
        width: multipleWidth* 620
        height: multipleHeight* 360
        radius: multipleWidth* 5
        x: multipleWidth*60
        y: multipleHeight*337
        border.color: "#BBBBBB"
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
            color: "#9A9A9A"
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
            color: "#9A9A9A"
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
            color: "#9A9A9A"
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
            color: "#9A9A9A"
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
        }
        RoundButton{
            id: stopbtn
            width: multipleWidth* 80
            height: multipleHeight* 30
            text: "Stop"
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
                text: qsTr("2023.9.22 13:03:59")
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: etime
                anchors.right: stime.right
                anchors.top: stime.bottom
                anchors.topMargin: multipleWidth*12
                width: multipleWidth* 141
                height: multipleHeight* 23
                text: qsTr("2023.9.22 13:03:59")
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: arun
                anchors.right: stime.right
                anchors.top: etime.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: qsTr("12345")
                font.pixelSize: multipleWidth* 16
            }
            Text {
                id: moder
                anchors.right: stime.right
                anchors.top: arun.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: qsTr("Auto")
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: ppmnum
                anchors.right: stime.right
                anchors.top: moder.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: qsTr("21")
                font.pixelSize: multipleWidth* 16
            }

            Text {
                id: anum
                anchors.right: ppmnum.right
                anchors.top: ppmnum.bottom
                anchors.topMargin: multipleWidth*12
                height: multipleHeight* 23
                text: qsTr("15111110")
                font.pixelSize: multipleWidth* 16
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
        property var wid: plcTable.width
        property var hei: plcTable.height
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
            text: styleData.value
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            property double wid: plcTable.width
        }
        model: ListModel {
            id: plcModel
            ListElement {
                name: "Power"
                fmin: ""
                fcurrent: ""
                fmax: ""
                mname:"Tune"
                mmin: ""
                mcurrent: ""
                mmax: ""
            }
            ListElement {
                name: "Freq-offset"
                fmin: ""
                fcurrent: ""
                fmax: ""
                mname:"Amplitude"
                mmin: ""
                mcurrent: ""
                mmax: ""
            }
            ListElement {
                name: "Counter"
                fmin: ""
                fcurrent: ""
                fmax: ""
                mname:""
                mmin: ""
                mcurrent: ""
                mmax: ""
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
            text: styleData.value
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            property double wid: machinedataTable.width
        }
        model: ListModel {
            id: machinedataModel
            ListElement {
                name1: "Amplitude Setting"
                name2: ""
                name3: "Engery Setting"
                name4: ""
            }
            ListElement {
                name1: "Time Setting"
                name2: ""
                name3: "Trigger Pressure Setting"
                name4: ""
            }
            ListElement {
                name1: "Weld Pressure Setting"
                name2: ""
                name3: "Weld Mode Setting"
                name4: ""
            }
            ListElement {
                name1: "Actual Weld Time"
                name2: ""
                name3: "Actual Weld Engery"
                name4: ""
            }
            ListElement {
                name1: "Actual Peak PowerC"
                name2: ""
                name3: "Actual Pre-Height"
                name4: ""
            }
            ListElement {
                name1: "Actual Post-Height"
                name2: ""
                name3: ""
                name4: ""
            }
            ListElement {
                name1: "Quality Time Upper"
                name2: ""
                name3: "Quality Time Lower"
                name4: ""
            }
            ListElement {
                name1: "Quality Power Upper"
                name2: ""
                name3: "Quality Power Lower"
                name4: ""
            }
            ListElement {
                name1: "Quality Per-Height Upper"
                name2: ""
                name3: "Quality Per-Height Lower"
                name4: ""
            }
            ListElement {
                name1: "Quality Post-Height Upper"
                name2: ""
                name3: "Quality Post-Height Lower"
                name4: ""
            }
            ListElement {
                name1: "Alarm"
                name2: ""
                name3: "Counter"
                name4: ""
            }
        }
        focus: true
    }
}
