import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    id: root
    Text {
        id: ip
        text: qsTr("IP Address")
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin:57
        anchors.leftMargin: 60
        color: "#3D7AB3"
        font.pixelSize: 20
    }
    Rectangle{
        width: 300
        height: 1
        color: "#BBBBBB"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 85
        anchors.leftMargin: 60
    }
    Text {
        id: plc
        text: qsTr("PLC:")
        color: "#101010"
        font.pixelSize: 18
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 127
        anchors.leftMargin: 60
    }
    Text {
        id: ipaddress
        text: qsTr("IP Address   192.168.0.10")
        color: "#101010"
        font.pixelSize: 18
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 130
        anchors.leftMargin: 200
    }
    Text {
        id: port
        text: qsTr("Port         4840")
        color: "#101010"
        font.pixelSize: 18
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 175
        anchors.leftMargin: 200
    }
    CustomMachine{
        id: m1
        width: 1068
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 232
        anchors.leftMargin: 60
        plcName:"Machine 1:"
    }
    CustomMachine{
        id: m2
        width: 1068
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 332
        anchors.leftMargin: 60
        plcName:"Machine 2:"
    }
    CustomMachine{
        id: m3
        width: 1068
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 432
        anchors.leftMargin: 60
        plcName:"Machine 3:"
    }
    CustomMachine{
        id: m4
        width: 1068
        height: 30
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 532
        anchors.leftMargin: 60
        plcName:"Machine 4:"
    }
    RoundButton {
        id:btn
        width: 100
        height: 38
        text: "SAVE"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.bottomMargin: 132
        anchors.leftMargin: 60
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
            font.pixelSize: 20
        }
    }
}
