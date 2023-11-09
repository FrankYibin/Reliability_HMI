import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.15

Rectangle {
    id:root
    color: "#ffffff"
    property alias username: useredit
    property alias userpass: passedit
    signal signalLogin(var id)

    function authenticationFailed(){//认证失败
        if(useredit.text === "Branson" && passedit.text == "Branson123"){
            signalLogin(reliabilityTestingSystem)
        }
        else{
            failed.visible = true
        }
        username.text = ""
        userpass.text = ""
    }
    Image {
        id: logpng
        anchors.left: parent.left
        anchors.top: parent.top
        width: multipleWidth* 800
        height: multipleHeight* 450
        anchors.leftMargin: multipleWidth* 80
        anchors.topMargin: multipleWidth* 225
        source: "login.png"
    }
    Rectangle{
        id: login
        width: multipleWidth* 360
        height: multipleHeight* 395
        anchors.right: root.right
        anchors.rightMargin: multipleWidth* 142
        anchors.top: root.top
        anchors.topMargin: multipleWidth* 253
        color: "#ffffff"
        radius: 5
        border.color: Qt.rgba(255, 255, 255, 1)
        layer.enabled: true  // 设置layer为enable
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset:3
            verticalOffset: 3
            color: Qt.rgba(0, 0, 0, 0.2)
            samples:100
        }
        Text {
            id: name
            anchors.top:parent.top
            anchors.topMargin: multipleWidth* 55
            anchors.left: parent.left
            anchors.leftMargin: multipleWidth* 28
            text: qsTr("Reliability Testing System")
            color: "#101010"
            font.pixelSize: multipleWidth* 24;
        }
        Rectangle{
            id: user
            anchors.top: login.top
            anchors.left: login.left
            anchors.topMargin: multipleWidth* 140
            anchors.leftMargin: multipleWidth* 38
            width: multipleWidth* 284
            height: multipleHeight* 45
            radius: 5
            border.color: "#DCDCDC"
            Image {
                id: userpng
                width: multipleWidth* 25
                height: multipleHeight* 25
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: multipleWidth* 10
                anchors.topMargin: multipleWidth* 10
                source: "user.png"
            }
            TextInput {
                id:useredit
                width: multipleWidth* 240
                height: multipleHeight* 45
                anchors.top: parent.top
                anchors.left: userpng.right
                anchors.leftMargin: multipleWidth* 5
                anchors.margins: 2
                font.pixelSize: multipleWidth* 15
                verticalAlignment: Text.AlignVCenter
                focus: true
                clip: true
            }
        }
        Rectangle{
            id: pass
            anchors.top: login.top
            anchors.left: login.left
            anchors.topMargin: multipleWidth* 210
            anchors.leftMargin: multipleWidth* 38
            width: multipleWidth* 284
            height: multipleHeight* 45
            radius: 5
            border.color: "#DCDCDC"
            Image {
                id: passpng
                width: multipleWidth* 25
                height: multipleHeight* 25
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: multipleWidth* 10
                anchors.topMargin: multipleWidth* 10
                source: "pass.png"
            }
            TextInput {
                id:passedit
                width: multipleWidth* 240
                height: multipleHeight* 45
                anchors.top: parent.top
                anchors.left: passpng.right
                anchors.leftMargin: multipleWidth* 5
                font.pixelSize: multipleWidth* 15
                verticalAlignment: Text.AlignVCenter
                focus: true
                clip: true
                echoMode: TextInput.Password
                autoScroll:true
            }
        }
        RoundButton {
            id:btn
            width: multipleWidth* 284
            height: multipleHeight* 45
            text: "Login"
            anchors.top: login.top
            anchors.left: login.left
            anchors.topMargin: multipleWidth* 288
            anchors.leftMargin: multipleWidth* 38
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
                font.pixelSize: multipleWidth* 16
            }
            onClicked: {
                authenticationFailed()
            }
        }
        Text {
            id: failed
            text: qsTr("Incorrect username or password")
            anchors.top: btn.bottom
            anchors.left: btn.left
            anchors.topMargin: multipleWidth* 20
            color: "#BD3124"
            font.pixelSize: multipleWidth* 14
            visible: false
        }
    }
}
