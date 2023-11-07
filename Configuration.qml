import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    id: root
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
        x:60
        y:632
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
            font.pixelSize: 20
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
        font.pixelSize: 14
        visible: false
    }
}
