import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.15

Rectangle {
    id:root
    color: "#ffffff"
    property alias username: useredit
    property alias userpass: passedit
    signal signalLogin(string name,string pass)
    function authenticationFailed(){//认证失败
        failed.visible = true
        username.text = ""
        userpass.text = ""
    }
    Image {
        id: logpng
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 80
        anchors.topMargin: 225
        source: "qrc:/images/login.png"
    }
    Rectangle{
        id: login
        width: 360;
        height: 395;
        anchors.right: root.right
        anchors.rightMargin: 142;
        anchors.top: root.top
        anchors.topMargin: 253;
        color: "#ffffff"
        radius: 3
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
            anchors.topMargin: 55
            anchors.left: parent.left
            anchors.leftMargin: 28
            text: qsTr("Reliability Testing System")
            color: "#101010"
            font.pixelSize: 24;
        }
        Rectangle{
            id: user
            anchors.top: login.top
            anchors.left: login.left
            anchors.topMargin: 140
            anchors.leftMargin: 38
            width: 284
            height: 45
            radius: 5
            border.color: "#DCDCDC"
            Image {
                id: userpng
                width: 25
                height: 25
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.topMargin: 10
                source: "qrc:/images/user.png"
            }
            TextInput {
                id:useredit
                width: 240
                anchors.top: userpng.top
                anchors.left: userpng.right
                anchors.leftMargin: 5
                anchors.margins: 2
                font.pointSize: 15
                focus: true
                clip: true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    useredit.focus = true
                }
            }
        }
        Rectangle{
            id: pass
            anchors.top: login.top
            anchors.left: login.left
            anchors.topMargin: 210
            anchors.leftMargin: 38
            width: 284
            height: 45
            radius: 5
            border.color: "#DCDCDC"
            Image {
                id: passpng
                width: 25
                height: 25
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.topMargin: 10
                source: "qrc:/images/pass.png"
            }
            TextInput {
                id:passedit
                width: 240
                anchors.top: passpng.top
                anchors.left: passpng.right
                anchors.leftMargin: 5
                anchors.margins: 2
                font.pointSize: 15
                focus: true
                clip: true
                echoMode: TextInput.Password
                autoScroll:true
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    passedit.focus = true
                }
            }
        }
        RoundButton {
            id:btn
            width: 284
            height: 45
            text: "Login"
            anchors.top: login.top
            anchors.left: login.left
            anchors.topMargin: 288
            anchors.leftMargin: 38
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
                font.pixelSize: 16
            }
            onClicked: {
                authenticationFailed()
                signalLogin(username.text,userpass.text)
            }
        }
        Text {
            id: failed
            text: qsTr("Incorrect username or password")
            anchors.top: btn.bottom
            anchors.left: btn.left
            anchors.topMargin: 20
            color: "#BD3124"
            font.pixelSize: 14
            visible: false
        }
    }
}
