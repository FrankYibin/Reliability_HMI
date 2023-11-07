import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    property string plcName: ""
    property string nameedit: machtext.text
    property string ip: ipdata.text
    property string port: portdata.text
    function updata(name,ip,port){
        ipdata.text = ip
        machtext.text = name
        portdata.text = port
    }

    AutoResize {
        fixedAspectRatio: false
        accordingToX: true
    }
    Text {
        id: name
        text: plcName
        color: "#101010"
        font.pixelSize: 18
        anchors.verticalCenter: parent.verticalCenter
        width: 105
        height: 25
    }
    Text {
        id: machname
        text: "Machine Name"
        color: "#101010"
        font.pixelSize: 18
        width: 127
        height: 25
        anchors.verticalCenter: name.verticalCenter
        x:140
    }
    Rectangle{
        id:machedit
        width: 200
        height: 30
        x:282
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            id: machtext
            anchors.fill: parent
            anchors.leftMargin: 3
            font.pixelSize: 18
            focus: true
            clip: true
            autoScroll:true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#101010"
        }
    }
    Text {
        id: iptext
        text: qsTr("IP Address")
        font.pixelSize: 16
        color: "#101010"
        width: 89
        height: 25
        anchors.verticalCenter: machname.verticalCenter
        x:515
    }
    Text {
        id: porttext
        text: qsTr("Port")
        font.pixelSize: 16
        color: "#101010"
        width: 36
        height: 25
        x:515
        y:45
    }
    Rectangle{
        id:ipedit
        width: 200
        height: 30
        x:622
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            id: ipdata
            width: 190
            height: 30
            anchors.leftMargin: 3
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
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
        x:622
        y:45
        radius: 5
        TextInput {
            id: portdata
            width: 190
            height: 30
            anchors.leftMargin: 3
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 18
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
        x:862
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
        x:982
        y:5
        radius: 10
        color: "#9A9A9A"
    }
}
