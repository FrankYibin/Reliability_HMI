import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as SwitchGroup
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15
Rectangle {
    id:root
    signal signalBackLogin()
    Text {
        id: machineselected
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 37
        anchors.leftMargin: 60
        text: qsTr("Machine Selected")
        color: "#000000"
        font.pixelSize: 20
    }
    ComboBox{
        id: machinename
        width: 120
        height: 32
        x:259
        y:35

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
            y: machinename.topPadding + (machinename.availableHeight - height) / 2
            width: 16
            height: 16
            source: "qrc:/images/user.png"
        }
    }
    RadioButton{
        id: manual
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 122
        anchors.leftMargin: 53
        text: " Manual"
        font.pixelSize:20
        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: manual.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            border.color: manual.checked ? "#3D7AB3" : "#9A9A9A"
            Rectangle {
                color: "#3D7AB3"
                width: 18
                height: 18
                x: 4
                y: 4
                radius: 9
                visible: manual.checked
            }
        }
    }
    RadioButton{
        id: auto
        anchors.top: manual.top
        anchors.left: manual.right
        anchors.leftMargin: 35
        text: " Auto"
        font.pixelSize:20
        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: auto.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            border.color: auto.checked ? "#3D7AB3" : "#9A9A9A"
            Rectangle {
                color: "#3D7AB3"
                width: 18
                height: 18
                x: 4
                y: 4
                radius: 9
                visible: auto.checked
            }
        }
    }
    RadioButton{
        id: merecycle
        anchors.top: auto.top
        anchors.left: auto.right
        anchors.leftMargin: 70
        text: " Merecycle"
        font.pixelSize:20
        indicator: Rectangle {
            implicitWidth: 26
            implicitHeight: 26
            x: merecycle.leftPadding
            y: parent.height / 2 - height / 2
            radius: 13
            border.color: merecycle.checked ? "#3D7AB3" : "#9A9A9A"
            Rectangle {
                color: "#3D7AB3"
                width: 18
                height: 18
                x: 4
                y: 4
                radius: 9
                visible: merecycle.checked
            }
        }
    }
    CheckBox{
        id:alarmlock
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 185
        anchors.leftMargin: 53
        text: " Alarm Lock"
        font.pixelSize: 20
    }
    CheckBox{
        id:dataprocessing
        text: " Data Processing"
        anchors.top: alarmlock.top
        anchors.left: alarmlock.right
        anchors.leftMargin: 30
        font.pixelSize: 20
        //        indicator: Rectangle {
        //            implicitWidth: 30
        //            implicitHeight: 30
        //            radius: 3
        //            border.color: dataprocessing.activeFocus ? "darkblue" : "gray"
        //            border.width: 1
        //            Rectangle {
        //                visible: control.checked
        //                color: "#555"
        //                border.color: "#333"
        //                radius: 1
        //                anchors.margins: 4
        //                anchors.fill: parent
        //            }
        //        }
    }
    Text {
        id: batchsize
        text: qsTr("Batch Size:")
        font.pixelSize: 20
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 250
        anchors.leftMargin: 60
    }
    Rectangle{
        id:batchsizeedit
        width: 88
        height: 32
        anchors.top: parent.top
        anchors.left: batchsize.right
        anchors.leftMargin: 20
        anchors.topMargin: 245
        border.color: "#DCDCDC"
        radius: 3
        TextInput {
            anchors.left: parent.left
            width: 80
            height: 32
            anchors.leftMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 20
            focus: true
            clip: true
            autoScroll:true
        }
    }
    RoundButton{
        id: savebtn
        width:80
        height: 30
        text: "Save"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 247
        anchors.leftMargin: 299
        background: Rectangle{
            color: savebtn.pressed ?"#215476" :"#3D7AB3";
            radius: 5
        }
        contentItem: Text {
            text: parent.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: 14
        }
    }
    Rectangle{
        id: machine
        width: 620
        height: 360
        radius: 5
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 60
        anchors.bottomMargin: 105
        border.color: "#BBBBBB"
        Text {
            id: machineinfor
            text: qsTr("3# MW-XA-3 [EP]")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 31
            anchors.topMargin: 27
            color: "#3D7AB3"
            font.pixelSize: 20
        }
        Rectangle{
            id: readyrect
            width: 86
            height: 20
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 109
            anchors.leftMargin: 36
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: readyrectname
            text: qsTr("Ready")
            anchors.top: readyrect.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 52
            font.pixelSize: 18
        }
        Rectangle{
            id: datareadyrect
            width: 86
            height: 20
            anchors.top: readyrect.top
            anchors.left: readyrect.right
            anchors.leftMargin: 30
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: datareadyrectname
            text: qsTr("Data Ready")
            anchors.top: datareadyrect.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 147
            font.pixelSize: 18
        }
        Rectangle{
            id: sonicsrect
            width: 86
            height: 20
            anchors.top: readyrect.bottom
            anchors.left: readyrect.left
            anchors.topMargin: 55
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: sonicsrectname
            text: qsTr("Sonics")
            anchors.top: sonicsrect.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 53
            font.pixelSize: 18
        }
        Rectangle{
            id: dataalarmrect
            width: 86
            height: 20
            anchors.top: sonicsrect.top
            anchors.left: sonicsrect.right
            anchors.leftMargin: 30
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: dataalarmrectname
            text: qsTr("Data Alarm")
            anchors.top: dataalarmrect.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 148
            font.pixelSize: 18
        }
        Rectangle{
            id: alarmrect
            width: 86
            height: 20
            anchors.top: sonicsrect.bottom
            anchors.left: sonicsrect.left
            anchors.topMargin: 55
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: alarmrectname
            text: qsTr("Alarm")
            anchors.top: alarmrect.bottom
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 54
            font.pixelSize: 18
        }
        RoundButton{
            id: resetbtn
            width: 80
            height: 30
            text: "Reset"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 27
            anchors.leftMargin: 400
            background: Rectangle{
                color: resetbtn.pressed ?"#215476" :"#3D7AB3";
                radius: 5
            }
            contentItem: Text {
                text: parent.text
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: 14
            }
        }
        RoundButton{
            id: stopbtn
            width: 80
            height: 30
            text: "Stop"
            anchors.top: resetbtn.top
            anchors.left: resetbtn.right
            anchors.leftMargin: 30
            background: Rectangle{
                color: stopbtn.pressed ?"#215476" :"#3D7AB3";
                radius: 5
            }
            contentItem: Text {
                text: parent.text
                color: "#FFFFFF"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                font.pixelSize: 14
            }
        }
        Rectangle{
            id: machinedetails
            width: 302
            height: 221
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 45
            anchors.right: parent.right
            anchors.rightMargin: 30
            radius: 5
            border.color: "#BBBBBB"
            Text {
                id: starttime
                text: qsTr("Start Time")
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 10
                anchors.leftMargin: 14
                font.pixelSize: 18
            }
            Text {
                id: endtime
                text: qsTr("End Time")
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 45
                anchors.leftMargin: 14
                font.pixelSize: 18
            }
            Text {
                id: alreadyrun
                text: qsTr("Already Run")
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 80
                anchors.leftMargin: 14
                font.pixelSize: 18
            }
            Text {
                id: mode
                text: qsTr("Mode")
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 115
                anchors.leftMargin: 14
                font.pixelSize: 18
            }
            Text {
                id: ppm
                text: qsTr("PPM")
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 150
                anchors.leftMargin: 14
                font.pixelSize: 18
            }
            Text {
                id: alarmnum
                text: qsTr("Alarm Number")
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.topMargin: 185
                anchors.leftMargin: 14
                font.pixelSize: 18
            }
            Text {
                id: stime
                text: qsTr("2023.9.22 13:03:59")
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 11
                anchors.rightMargin: 13
            }
            Text {
                id: etime
                text: qsTr("2023.9.22 13:03:59")
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 46
                anchors.rightMargin: 13
            }
            Text {
                id: arun
                text: qsTr("152333")
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 81
                anchors.rightMargin: 13
            }
            Text {
                id: moder
                text: qsTr("Auto")
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 116
                anchors.rightMargin: 13
            }
            Text {
                id: ppmnum
                text: qsTr("21")
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 151
                anchors.rightMargin: 13
            }
            Text {
                id: anum
                text: qsTr("150")
                font.pixelSize: 16
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.topMargin: 185
                anchors.rightMargin: 13
            }
        }
    }
    RoundButton{
        id:estop
        radius: 5
        height: 30
        width: 80
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 37
        anchors.rightMargin: 138
        text: "E-Stop"
        background: Rectangle{
            border.color: "#BD3124"
            color: estop.pressed ?"#000000" :"#FFF81D";
            radius: 5
        }
        contentItem: Text {
            text: parent.text
            color: "#BD3124"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: 16
        }
        onPressed: {
            if(text === "E-Stop"){
                text = "E-Stop Reset"
                width = 120
            }
            else{
                text = "E-Stop"
                width = 80
            }
        }
    }
    RoundButton{
        id:back
        radius: 5
        height: 30
        width: 80
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 37
        anchors.rightMargin: 28
        text: "Back"
        background: Rectangle{
            color: back.pressed ?"#215476" :"#3D7AB3";
            radius: 5
        }
        contentItem: Text {
            text: parent.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: 16
        }
    }

    Text {
        id: plc
        text: qsTr("PLC Data")
        font.pixelSize: 20
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 114
        anchors.rightMargin: 337
    }
    SwitchGroup.TableView {
        id: plcTable
        width: 660
        height: 120
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 157
        anchors.rightMargin: 58
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
        SwitchGroup.TableViewColumn {
            role: "name"
            title: ""
            width: 125
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "fmin"
            title: "Min"
            width: 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "fcurrent"
            title: "Current"
            width: 67
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "fmax"
            title: "Max"
            width: 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "mname"
            title: ""
            width: 125
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "mmin"
            title: "Min"
            width: 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "mcurrent"
            title: "Current"
            width: 67
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "mmax"
            title: "Max"
            width: 65
            resizable:false
        }
        headerDelegate: Rectangle{
            height: 30
            Text {
                id: headerName
                text: styleData.value
                font.pixelSize: 18
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
            }
        }
        rowDelegate: Rectangle{
            id:rowRectangle
            color:styleData.row % 2 == 0 ? "#F2F2F2" : "#FFFFFF"
            height: 30
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            text: styleData.value
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
        }
        model: ListModel {
            id: plcModel
            ListElement {
                name: "Power"
                fmin: ""
                fcurrent: ""
                fmax:""
                mname:"Tune"
                mmin: ""
                mcurrent: ""
                mmax:""
            }
            ListElement {
                name: "Freq-offset"
                fmin: ""
                fcurrent: ""
                fmax:""
                mname:"Amplitude"
                mmin: ""
                mcurrent: ""
                mmax:""
            }
            ListElement {
                name: "Counter"
                fmin: ""
                fcurrent: ""
                fmax:""
                mname:""
                mmin: ""
                mcurrent: ""
                mmax:""
            }
        }
        focus: true
    }

    Text {
        id: machinedata
        text: qsTr("Machine Data")
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 304
        anchors.rightMargin: 315
        font.pixelSize: 20
    }
    SwitchGroup.TableView {
        id: machinedataTable
        width: 690
        height: 330
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 347
        anchors.rightMargin: 43
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
        SwitchGroup.TableViewColumn {
            role: "name1"
            title: ""
            width: 225
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "name2"
            title: ""
            width: 115
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "name3"
            title: ""
            width: 220
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            role: "name4"
            title: ""
            width: 115
            resizable:false
        }
        headerDelegate: Rectangle{
            height:0
        }
        rowDelegate: Rectangle{
            color:styleData.row % 2 == 0 ? "#F2F2F2" : "#FFFFFF"
            height: 30
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            text: styleData.value
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
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
