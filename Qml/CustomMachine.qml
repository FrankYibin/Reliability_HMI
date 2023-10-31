import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    property string plcName: ""
    Text {
        id: name
        text: plcName
        color: "#101010"
        font.pixelSize: 18
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: machname
        text: "Machine Name"
        color: "#101010"
        font.pixelSize: 18
        anchors.left: name.right
        anchors.leftMargin: 35
        anchors.verticalCenter: name.verticalCenter
    }
    Rectangle{
        id:machedit
        width: 200
        height: 30
        anchors.verticalCenter: machname.verticalCenter
        anchors.left: machname.right
        anchors.leftMargin: 15
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            anchors.left: parent.left
            width: 190
            height: 30
            anchors.leftMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 18
            focus: true
            clip: true
            autoScroll:true
            color: "#101010"
        }
    }
    Text {
        id: iptext
        text: qsTr("IP Address")
        font.pointSize: 16
        color: "#101010"
        anchors.left: machedit.right
        anchors.leftMargin: 33
        anchors.verticalCenter: machname.verticalCenter
    }
    Text {
        id: porttext
        text: qsTr("Port")
        font.pointSize: 16
        color: "#101010"
        anchors.left: machedit.right
        anchors.leftMargin: 33
        anchors.top: iptext.bottom
        anchors.topMargin: 20
    }
    Rectangle{
        id:ipedit
        width: 200
        height: 30
        anchors.verticalCenter: machedit.verticalCenter
        anchors.left: iptext.right
        anchors.leftMargin: 18
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            anchors.left: parent.left
            width: 190
            height: 30
            anchors.leftMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 18
            focus: true
            clip: true
            autoScroll:true
            color: "#101010"
        }
    }
    Rectangle{
        id:portedit
        width: 200
        height: 30
        anchors.top: ipedit.bottom
        anchors.left: ipedit.left
        anchors.topMargin: 15
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            anchors.left: parent.left
            width: 190
            height: 30
            anchors.leftMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 18
            focus: true
            clip: true
            autoScroll:true
            color: "#101010"
        }
    }
    RoundButton {
        id:btn
        width: 80
        height: 30
        text: "Test"
        anchors.top: ipedit.top
        anchors.left: ipedit.right
        anchors.leftMargin: 40
        background: Rectangle{
            color: btn.pressed ?"#215476" :"#3D7AB3";
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
        id: teststatus
        width: 86
        height: 20
        anchors.verticalCenter: btn.verticalCenter
        anchors.left: btn.right
        anchors.leftMargin: 40
        radius: 10
        color: "#9A9A9A"
    }
}
