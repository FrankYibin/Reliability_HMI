import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    id: root
    property int index:multipleWidth* -1
    Connections{
        target:ConfigurationQml
        function onConfig(list){
            if(list[0] === 1){
                m1.updata(list[2],list[6],list[7])
            }
            else if(list[0] === 2){
                m2.updata(list[2],list[6],list[7])
            }
            else if(list[0] === 3){
                m3.updata(list[2],list[6],list[7])
            }
            else if(list[0] === 4){
                m4.updata(list[2],list[6],list[7])
            }
        }
    }
    Connections{
        target: Client
        function onConnectStatus(status){
            console.log(status)
            if(status === 0){

            }
            else if(status === 1){

            }
        }
    }

    function isEmpty(){
        if(m1.nameedit.length === 0 || m1.ip.length === 0 || m1.port.length === 0 ||
                m2.nameedit.length === 0 || m2.ip.length === 0 || m2.port.length === 0 ||
                m3.nameedit.length === 0 || m3.ip.length === 0 || m3.port.length === 0 ||
                m4.nameedit.length === 0 || m4.ip.length === 0 || m4.port.length === 0){
            return true
        }
        else{
            return false
        }
    }
    Text {
        id: ip
        text: qsTr("IP Address")
        width: multipleWidth* 99
        height: multipleHeight* 28
        x:multipleWidth*60
        y:multipleHeight*57
        color: "#3D7AB3"
        font.pixelSize: multipleWidth* 20
    }
    Rectangle{
        width: multipleWidth* 300
        height: multipleHeight* 1
        color: "#BBBBBB"
        x:multipleWidth*60
        y:multipleHeight*85
    }
    Text {
        id: plc
        text: qsTr("PLC:")
        color: "#101010"
        font.pixelSize: multipleWidth* 18
        x:multipleWidth*60
        y:multipleHeight*127
        width: multipleWidth* 37
        height: multipleHeight* 25
    }
    Text {
        id: ipaddress
        text: qsTr("IP Address   192.168.0.10")
        color: "#101010"
        font.pixelSize: multipleWidth* 18
        width: multipleWidth* 195
        height: multipleHeight* 25
        x:multipleWidth*200
        y:multipleHeight*130
    }
    Text {
        id: port
        text: qsTr("Port         4840")
        color: "#101010"
        font.pixelSize: multipleWidth* 18
        width: multipleWidth* 150
        height: multipleHeight* 25
        x:multipleWidth*200
        y:multipleHeight*175
    }

    RoundButton {
        id:btn
        width: multipleWidth* 80
        height: multipleHeight* 30
        text: "Test"
        x:multipleWidth*922
        y:multipleHeight*132
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
        }
    }
    Rectangle{
        id: toptest
        width: multipleWidth* 86
        height: multipleHeight* 20
        x:multipleWidth*1042
        y:multipleHeight*137
        radius: 10
        color: "#9A9A9A"
    }
    CustomMachine{
        id: m1
        width: multipleWidth* 1068
        height: multipleHeight* 30
        x:multipleWidth*60
        y:multipleHeight*232
        plcName:"Machine 1:"
        onSigConnectTest: {
            index = 1
            Client.connectionTest(ip,port)
        }
    }
    CustomMachine{
        id: m2
        width: multipleWidth* 1068
        height: multipleHeight* 30
        x:multipleWidth*60
        y:multipleHeight*332
        plcName:"Machine 2:"
        onSigConnectTest: {
            index = 2
            Client.connectTcpsocket(ip,port)
        }
    }
    CustomMachine{
        id: m3
        width: multipleWidth* 1068
        height: multipleHeight* 30
        x:multipleWidth*60
        y:multipleHeight*432
        plcName:"Machine 3:"
        onSigConnectTest: {
            index = 3
            Client.connectTcpsocket(ip,port)
        }
    }
    CustomMachine{
        id: m4
        width: multipleWidth* 1068
        height: multipleHeight* 30
        x:multipleWidth*60
        y:multipleHeight*532
        plcName:"Machine 4:"
        onSigConnectTest: {
            index = 4
            Client.connectTcpsocket(ip,port)
        }
    }
    RoundButton {
        id:topbtn
        width: multipleWidth* 100
        height: multipleHeight* 38
        text: "SAVE"
        x:multipleWidth*60
        y:multipleHeight*632
        background: Rectangle{
            color: topbtn.pressed ?"#215476" :"#3D7AB3";
            radius: 5
        }
        contentItem: Text {
            text: parent.text
            color: "#FFFFFF"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pixelSize: multipleWidth* 20
        }
        onClicked: {
            if(isEmpty()){
                warn.visible = true
            }
            else{
                warn.visible = false
                ConfigurationQml.updateConfiguration(1,m1.nameedit,m1.ip,m1.port)
                ConfigurationQml.updateConfiguration(2,m2.nameedit,m2.ip,m2.port)
                ConfigurationQml.updateConfiguration(3,m3.nameedit,m3.ip,m3.port)
                ConfigurationQml.updateConfiguration(4,m4.nameedit,m4.ip,m4.port)
            }


        }
    }
    Text {
        id: warn
        text: qsTr("Machine Name/ip/port is not empty")
        anchors.top: topbtn.bottom
        anchors.left: topbtn.left
        anchors.topMargin: 15
        color: "#BD3124"
        font.pixelSize: multipleWidth* 14
        visible: false
    }
}
