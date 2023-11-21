import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    property string plcName: ""
    property string nameedit: machtext.text
    property string ip: ipdata.text
    property string port: portdata.text
    property int status: -1
    signal sigConnectTest(string ip,string port)
    function updata(name,ip,port){
        ipdata.text = ip
        machtext.text = name
        portdata.text = port
    }

    Text {
        id: name
        text: plcName
        color: "#101010"
        font.family: fregular.name
        font.pixelSize: multipleWidth* 18
        anchors.verticalCenter: parent.verticalCenter
        width: multipleWidth* 105
        height: multipleHeight* 25
    }
    Text {
        id: machname
        text: "Machine Name"
        color: "#101010"
        font.family: fregular.name
        font.pixelSize: multipleWidth* 18
        width: multipleWidth* 127
        height: multipleHeight* 25
        anchors.verticalCenter: name.verticalCenter
        x: multipleWidth*140
    }
    Rectangle{
        id:machedit
        width: multipleWidth* 200
        height: multipleHeight* 30
        x: multipleWidth*282
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            id: machtext
            anchors.fill: parent
            anchors.leftMargin: 3
            font.pixelSize: multipleWidth* 18
            focus: true
            clip: true
            autoScroll:true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#101010"
            font.family: fregular.name
        }
    }
    Text {
        id: iptext
        text: qsTr("IP Address")
        font.family: fregular.name
        font.pixelSize: multipleWidth* 16
        color: "#101010"
        width: multipleWidth* 89
        height: multipleHeight* 25
        anchors.verticalCenter: machname.verticalCenter
        x: multipleWidth*515
    }
    Text {
        id: porttext
        text: qsTr("Port")
        font.family: fregular.name
        font.pixelSize: multipleWidth* 16
        color: "#101010"
        width: multipleWidth* 36
        height: multipleHeight* 25
        x: multipleWidth*515
        y: multipleHeight*45
    }
    Rectangle{
        id:ipedit
        width: multipleWidth* 200
        height: multipleHeight* 30
        x: multipleWidth*622
        border.color: "#BBBBBB"
        radius: 5
        TextInput {
            id: ipdata
            width: multipleWidth* 190
            height: multipleHeight* 30
            anchors.leftMargin: 3
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            focus: true
            clip: true
            autoScroll:true
            color: "#101010"
            font.family: fregular.name
        }
    }
    Rectangle{
        id:portedit
        width: multipleWidth* 200
        height: multipleHeight* 30
        anchors.top: ipedit.bottom
        anchors.left: ipedit.left
        anchors.topMargin: 15
        border.color: "#BBBBBB"
        x: multipleWidth*622
        y: multipleHeight*45
        radius: 5
        TextInput {
            id: portdata
            width: multipleWidth* 190
            height: multipleHeight* 30
            anchors.leftMargin: 3
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: multipleWidth* 18
            focus: true
            clip: true
            autoScroll:true
            color: "#101010"
            font.family: fregular.name
        }
    }
    RoundButton {
        id:btn
        width: multipleWidth* 80
        height: multipleHeight* 30
        text: "Test"
        x: multipleWidth*862
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
            font.pixelSize: multipleWidth* 14
            font.family: fregular.name
        }
        onPressed: {
            sigConnectTest(ipdata.text,portdata.text)
        }
    }
    Rectangle{
        id: teststatus
        width: multipleWidth* 86
        height: multipleHeight* 20
        x: multipleWidth*982
        y: multipleHeight*5
        radius: 10
        color: status === -1 ? "#9A9A9A" : status === 1 ? "#BD3124" : "#58A55C"
    }
}
