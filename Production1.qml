import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as SwitchGroup
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id:root

    AutoResize {
        fixedAspectRatio: false
        accordingToX: true
    }
    signal signalBackLogin()
    property double plcTableHei: 120
    property double machinedataTableHei: 330
    Text {
        id: machineselected
        x:60
        y:37
        width: 164
        height: 28
        text: qsTr("Machine Selected")
        color: "#000000"
        font.pixelSize: 20
        onWidthChanged: {
            if(width > 164){
                font.pixelSize = font.pixelSize * (width / 164)
            }
            else{
                font.pixelSize = 20
            }
        }
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
        onWidthChanged: {
            if(width > 120){
                font.pixelSize = font.pixelSize * (width / 120)
            }
            else{
                font.pixelSize = 20
            }
        }
    }
    Rectangle{
        id:switchradio
        x:55
        y:122
        width: 389
        height: 33
        AutoResize {
            fixedAspectRatio: false
            accordingToX: true
        }
        RadioButton{
            id: manual
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text: " Manual"
            font.pixelSize:20
            indicator: Rectangle {
                width: 26
                height: 26
                x: manual.x
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
    }

    CheckBox{
        id:alarmlock
        x:55
        y:185
        width: 185
        height: 33
        text: " Alarm Lock"
        font.pixelSize: 20
        onClicked: {

        }
    }
    CheckBox{
        id:dataprocessing
        text: " Data Processing"
        x:270
        y:185
        width: 210
        height: 33
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
        width: 101
        x:60
        y:247
        text: qsTr("Batch Size:")
        font.pixelSize: 20
        onWidthChanged: {
            if(width > 101){
                batchsize.font.pixelSize = batchsize.font.pixelSize * (width / 101)
            }
            else{
                batchsize.font.pixelSize = 20
            }
        }
    }
    Rectangle{
        id:batchsizeedit
        width: 88
        height: 32
        x:181
        y:245
        border.color: "#DCDCDC"
        radius: 3
        TextInput {
            width: 80
            height: 32
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
        width:80
        height: 30
        text: "Save"
        x:299
        y:247
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
        x:60
        y:337
        border.color: "#BBBBBB"
        AutoResize {
            fixedAspectRatio: false
            accordingToX: true
        }

        Text {
            id: machineinfor
            x:31
            y:27
            width: 157
            height: 28
            text: qsTr("3# MW-XA-3 [EP]")
            color: "#3D7AB3"
            font.pixelSize: 20
        }


        Rectangle{
            id: readyrect
            width: 86
            height: 20
            x:36
            y:109
            radius: 10
            color: "#9A9A9A"
        }

        Text {
            id: readyrectname
            width: 52
            height: 25
            x:52
            y:139
            text: qsTr("Ready")
            font.pixelSize: 18
        }


        Rectangle{
            id: datareadyrect
            width: 86
            height: 20
            x:152
            y:109
            radius: 10
            color: "#9A9A9A"
        }

        Text {
            id: datareadyrectname
            x:147
            y:139
            width: 96
            height: 25
            text: qsTr("Data Ready")
            font.pixelSize: 18
        }


        Rectangle{
            id: sonicsrect
            width: 86
            height: 20
            x:36
            y:184
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: sonicsrectname
            x:53
            y:214
            width: 54
            height: 25
            text: qsTr("Sonics")
            font.pixelSize: 18
        }

        Rectangle{
            id: dataalarmrect
            width: 86
            height: 20
            x:152
            y:184
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: dataalarmrectname
            x:148
            y:214
            width: 95
            height: 25
            text: qsTr("Data Alarm")
            font.pixelSize: 18
        }


        Rectangle{
            id: alarmrect
            width: 86
            height: 20
            x:36
            y:259
            radius: 10
            color: "#9A9A9A"
        }
        Text {
            id: alarmrectname
            x:54
            y:289
            width: 51
            height: 25
            text: qsTr("Alarm")
            font.pixelSize: 18
        }

        RoundButton{
            id: resetbtn
            width: 80
            height: 30
            text: "Reset"
            x:400
            y:27
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
            x:510
            y:27
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
            x:288
            y:94
            radius: 5
            border.color: "#BBBBBB"
            AutoResize {
                fixedAspectRatio: false
                accordingToX: true
            }
            Text {
                id: starttime
                x:14
                y:10
                width: 86
                height: 25
                text: qsTr("Start Time")
                font.pixelSize: 18
            }

            Text {
                id: endtime
                x:14
                y:45
                width: 79
                height: 25
                text: qsTr("End Time")
                font.pixelSize: 18
            }

            Text {
                id: alreadyrun
                x:14
                y:80
                width: 102
                height: 25
                text: qsTr("Already Run")
                font.pixelSize: 18
            }

            Text {
                id: mode
                x:14
                y:115
                width: 49
                height: 25
                text: qsTr("Mode")
                font.pixelSize: 18
            }

            Text {
                id: ppm
                x:14
                y:150
                width: 38
                height: 25
                text: qsTr("PPM")
                font.pixelSize: 18
            }
            Text {
                id: alarmnum
                x:14
                y:185
                width: 125
                height: 25
                text: qsTr("Alarm Number")
                font.pixelSize: 18
            }

            Text {
                id: stime
                x:148
                y:11
                width: 141
                height: 23
                text: qsTr("2023.9.22 13:03:59")
                font.pixelSize: 16
            }

            Text {
                id: etime
                x:148
                y:46
                width: 141
                height: 23
                text: qsTr("2023.9.22 13:03:59")
                font.pixelSize: 16
            }

            Text {
                id: arun
                x:234
                y:81
                width: 55
                height: 23
                text: qsTr("152333")
                font.pixelSize: 16
            }
            Text {
                id: moder
                x:253
                y:116
                width: 36
                height: 23
                text: qsTr("Auto")
                font.pixelSize: 16
            }

            Text {
                id: ppmnum
                x:270
                y:151
                width: 19
                height: 23
                text: qsTr("21")
                font.pixelSize: 16
            }

            Text {
                id: anum
                x:261
                y:185
                width: 28
                height: 23
                text: qsTr("150")
                font.pixelSize: 16
            }

        }
    }
    RoundButton{
        id:estop
        radius: 5
        height: 30
        width: 80
        x:1222
        y:37
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
            font.pixelSize: 20
        }
        onPressed: {
            if(text === "E-Stop"){
                text = "E-Stop Reset"
                width = 120 * (root.width/1440)
                x -= 40
            }
            else{
                text = "E-Stop"
                width = 80* (root.width/1440)
                x += 40
            }
        }
    }
    RoundButton{
        id:back
        radius: 5
        height: 30
        width: 80
        x:1332
        y:37
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
            font.pixelSize: 14
        }
    }
    Text {
        id: plc
        width: 85
        height: 28
        x:1018
        y:114
        text: qsTr("PLC Data")
        font.pixelSize: 20
        onWidthChanged: {
            if(width > 85){
                plc.font.pixelSize = plc.font.pixelSize * (width / 85)
            }
            else{
                plc.font.pixelSize = 20
            }
        }
    }
    SwitchGroup.TableView {
        id: plcTable
        width: 660
        height: 120
        x:738
        y:157
        property var wid: plcTable.width
        property var hei: plcTable.height
        AutoResize {
            fixedAspectRatio: false
            accordingToX: true
        }
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
        onWidthChanged: {
            p1.width = p1.width * (plcTable.width / wid)
            p2.width = p2.width * (plcTable.width / wid)
            p3.width = p3.width * (plcTable.width / wid)
            p4.width = p4.width * (plcTable.width / wid)
            p5.width = p5.width * (plcTable.width / wid)
            p6.width = p6.width * (plcTable.width / wid)
            p7.width = p7.width * (plcTable.width / wid)
            p8.width = p8.width * (plcTable.width / wid)
        }
        SwitchGroup.TableViewColumn {
            id: p1
            role: "name"
            title: ""
            width: 125
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p2
            role: "fmin"
            title: "Min"
            width: 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p3
            role: "fcurrent"
            title: "Current"
            width: 67
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p4
            role: "fmax"
            title: "Max"
            width: 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p5
            role: "mname"
            title: ""
            width: 125
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p6
            role: "mmin"
            title: "Min"
            width: 65
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p7
            role: "mcurrent"
            title: "Current"
            width: 67
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id: p8
            role: "mmax"
            title: "Max"
            width: 65
            resizable:false
        }
        headerDelegate: Rectangle{
            id: header
            height: 30
            color: "#F2F2F2"
            property double wid: plcTable.width
            Text {
                id: headerName
                text: styleData.value
                font.pixelSize: 18
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
            }
            onWidthChanged: {
                if(plcTable.width >= 660 && headerName.font.pixelSize !==18){
                    headerName.font.pixelSize = 18
                    header.height = 30
                }
                else if(plcTable.width > 660){
                    headerName.font.pixelSize = headerName.font.pixelSize * (plcTable.width / wid)
                    header.height = header.height * (plcTable.width / wid)
                }
            }
        }
        rowDelegate: Rectangle{
            id:rowRectangle
            color:styleData.row % 2 == 0 ? "#FFFFFF" : "#F2F2F2"
            height: 30

            onWidthChanged: {

                if(plcTable.width >= 660 && rowRectangle.height!==30){
                    rowRectangle.height = 30
                }
                else if(plcTable.width >= 660){
                    rowRectangle.height = rowRectangle.height * (plcTable.height / plcTableHei)
                }
            }
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            id: item
            text: styleData.value
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            property double wid: plcTable.width
            onWidthChanged: {
                if(plcTable.width >= 660 && font.pixelSize !==18){
                    font.pixelSize = 18
                }
                else if(plcTable.width >= 660){
                    font.pixelSize = font.pixelSize * (plcTable.width / wid)
                }
            }
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
        x:996
        y:304
        width: 129
        height: 28
        text: qsTr("Machine Data")
        font.pixelSize: 20
        onWidthChanged: {
            if(width > 129){
                font.pixelSize = font.pixelSize * (width / 129)
            }
            else{
                font.pixelSize = 20
            }
        }
    }

    SwitchGroup.TableView {
        id: machinedataTable
        width: 690
        height: 330
        x:725
        y:347
        property var wid: machinedataTable.width
        property var hei: machinedataTable.height
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏水平滚动条
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff//隐藏竖直滚动条
        frameVisible: false
        onWidthChanged: {
            a1.width = a1.width * (machinedataTable.width / wid)
            a2.width = a2.width * (machinedataTable.width / wid)
            a3.width = a3.width * (machinedataTable.width / wid)
            a4.width = a4.width * (machinedataTable.width / wid)
        }
        AutoResize {
            fixedAspectRatio: false
            accordingToX: true
        }
        SwitchGroup.TableViewColumn {
            id:a1
            role: "name1"
            title: ""
            width: 225
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id:a2
            role: "name2"
            title: ""
            width: 115
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id:a3
            role: "name3"
            title: ""
            width: 220
            resizable:false
        }
        SwitchGroup.TableViewColumn {
            id:a4
            role: "name4"
            title: ""
            width: 115
            resizable:false
        }
        headerDelegate: Rectangle{
            height:0
        }
        rowDelegate: Rectangle{
            id:rowRectangle1
            color:styleData.row % 2 == 0 ? "#F2F2F2" : "#FFFFFF"
            height: 30
            onWidthChanged: {
                if(machinedataTable.width >= 690 && rowRectangle1.height!==30){
                    rowRectangle1.height = 30
                }
                else if(machinedataTable.width >= 690){
                    rowRectangle1.height = rowRectangle1.height * (machinedataTable.height / 330)
                }
            }
        }
        // 设置每个单元格的字体样式
        itemDelegate: Text {
            id: item1
            text: styleData.value
            color: "#000000"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
            property double wid: machinedataTable.width
            onWidthChanged: {
                if(machinedataTable.width >= 690 && font.pixelSize !==18){
                    font.pixelSize = 18
                }
                else if(machinedataTable.width >= 690){
                    font.pixelSize = font.pixelSize * (machinedataTable.width / wid)
                }
            }
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
