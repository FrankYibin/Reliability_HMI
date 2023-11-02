import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    id: root
    AutoResize {
        fixedAspectRatio: false
        accordingToX: true
    }
    Text {
        id: ip
        text: qsTr("IP Address")
        width: 99
        height: 28
        x:60
        y:57
        color: "#3D7AB3"
        font.pixelSize: 20
    }
    Rectangle{
        width: 300
        height: 1
        color: "#BBBBBB"
        x:60
        y:85
    }
    Text {
        id: plc
        text: qsTr("PLC:")
        color: "#101010"
        font.pixelSize: 18
        x:60
        y:127
        width: 37
        height: 25
    }
    Text {
        id: ipaddress
        text: qsTr("IP Address   192.168.0.10")
        color: "#101010"
        font.pixelSize: 18
        width: 195
        height: 25
        x:200
        y:130
    }
    Text {
        id: port
        text: qsTr("Port         4840")
        color: "#101010"
        font.pixelSize: 18
        width: 150
        height: 25
        x:200
        y:175
    }

    RoundButton {
        id:btn
        width: 80
        height: 30
        text: "Test"
        x:922
        y:132
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
        id: toptest
        width: 86
        height: 20
        x:1042
        y:137
        radius: 10
        color: "#9A9A9A"
    }
    CustomMachine{
        id: m1
        width: 1068
        height: 30
        x:60
        y:232
        plcName:"Machine 1:"
    }
    CustomMachine{
        id: m2
        width: 1068
        height: 30
        x:60
        y:332
        plcName:"Machine 2:"
    }
    CustomMachine{
        id: m3
        width: 1068
        height: 30
        x:60
        y:432
        plcName:"Machine 3:"
    }
    CustomMachine{
        id: m4
        width: 1068
        height: 30
        x:60
        y:532
        plcName:"Machine 4:"
    }
    RoundButton {
        id:topbtn
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
