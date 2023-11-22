import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle{
    id: root
    property int index:multipleWidth* -1
    property int plcStatus: -1
    Connections{
        target:ConfigurationQml
        function onConfig(list){
            if(list[0] === 1){
                m1.updata(list[2],list[6],list[7])
                opcua.updateMode(0,list[3])
                opcua.updateBatchSize(0,list[8])
            }
            else if(list[0] === 2){
                m2.updata(list[2],list[6],list[7])
                opcua.updateMode(1,list[3])
                opcua.updateBatchSize(1,list[8])
            }
            else if(list[0] === 3){
                m3.updata(list[2],list[6],list[7])
                opcua.updateMode(2,list[3])
                opcua.updateBatchSize(2,list[8])
            }
            else if(list[0] === 4){
                m4.updata(list[2],list[6],list[7])
                opcua.updateMode(3,list[3])
                opcua.updateBatchSize(3,list[8])
            }
        }
    }
    //    Connections{
    //        target: TcpClient
    //        function onConnectStatus(status){
    //            if(index === 1){
    //                m1.status = status
    //            }
    //            else if(index === 2){
    //                m2.status = status
    //            }
    //            else if(index === 3){
    //                m3.status = status
    //            }
    //            else if(index === 4){
    //                m4.status = status
    //            }
    //        }
    //    }
//    Connections{
//        target: opcFacility1
//        function onSigStatus(status){
//            m1.status = status
//        }
//    }

//    Connections{
//        target: opcFacility2
//        function onSigStatus(status){
//            m2.status = status
//        }
//    }
//    Connections{
//        target: opcFacility3
//        function onSigStatus(status){
//            m3.status = status
//        }
//    }
//    Connections{
//        target: opcFacility4
//        function onSigStatus(status){
//            m4.status = status
//        }
//    }
//    Connections{
//        target: opcua
//        function onSigOpcStatus(status){
//            plcStatus = status
//        }
//    }

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
        font.family: fregular.name
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
        font.family: fregular.name
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
        font.family: fregular.name
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
        font.family: fregular.name
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
            font.family: fregular.name
        }
        onClicked: {
            if(opcua.currentEquipmentStatus() === true){
                plcStatus = 0
            }
            else{
                plcStatus = 1
            }
        }
    }
    Rectangle{
        id: toptest
        width: multipleWidth* 86
        height: multipleHeight* 20
        x:multipleWidth*1042
        y:multipleHeight*137
        radius: 10
        color: plcStatus === -1 ? "#9A9A9A" : plcStatus === 1 ? "#BD3124" : "#58A55C"
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
            if(opcFacility1.currentEquipmentStatus() === true){
                status = 0
            }
            else{
                status = 1
            }
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
            if(opcFacility2.currentEquipmentStatus() === true){
                status = 0
            }
            else{
                status = 1
            }
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
            if(opcFacility3.currentEquipmentStatus() === true){
                status = 0
            }
            else{
                status = 1
            }
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
            if(opcFacility4.currentEquipmentStatus() === true){
                status = 0
            }
            else{
                status = 1
            }
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
            font.family: fregular.name
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
        font.family: fregular.name
        anchors.top: topbtn.bottom
        anchors.left: topbtn.left
        anchors.topMargin: 15
        color: "#BD3124"
        font.pixelSize: multipleWidth* 14
        visible: false
    }
}
