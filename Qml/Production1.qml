import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.2
import QtGraphicalEffects 1.15
import QtQuick.Controls 1.4
Rectangle {
    id:root
    signal signalBackLogin()
    Text {
        id: production1name
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.topMargin: 6
        text: qsTr("Reliability Testing System")
        color: "#3D7AB3"
        font.pixelSize:26
    }
    RoundButton{
        id:logoutBtn
        width: 80
        height: 30
        text: "Logout"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 28
        background: Rectangle{
            color: logoutBtn.pressed ?"#215476" :"#3D7AB3";
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
        onClicked: {
            signalBackLogin()
        }
    }
    Rectangle{
        id:centerSwitch
        width: 1440
        height: 48
        anchors.top: parent.top
        anchors.topMargin: 50
        color: "#EFEFEF"
        Item {
            id: buttonRow
            anchors.left: parent.left
            ExclusiveGroup { id: buttonGroup } //提供一个组给按钮绑定
            CustomBtn{
                id:dashboard
                width: 144
                height: 48
                anchors.left: parent.left
                iconSrc:"qrc:/images/user.png"
                iconText: "Dashboard"
                exclusiveGroup: buttonGroup //绑定到组
            }
            CustomBtn{
                id:production
                width: 154
                height: 48
                anchors.left: dashboard.right
                iconSrc:"qrc:/images/user.png"
                iconText: "Production"
                exclusiveGroup: buttonGroup //绑定到组
            }
            CustomBtn{
                id:datalog
                width: 144
                height: 48
                anchors.left: production.right
                iconSrc:"qrc:/images/user.png"
                iconText: "Data Log"
                exclusiveGroup: buttonGroup //绑定到组
            }
            CustomBtn{
                id:report
                width: 124
                height: 48
                anchors.left: datalog.right
                iconSrc:"qrc:/images/user.png"
                iconText: "Report"
                exclusiveGroup: buttonGroup //绑定到组
            }
            CustomBtn{
                id:configuration
                width: 164
                height: 48
                anchors.left: report.right
                iconSrc:"qrc:/images/user.png"
                iconText: "Configuration"
                exclusiveGroup: buttonGroup //绑定到组
            }
        }
    }
}
