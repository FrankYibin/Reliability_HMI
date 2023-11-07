import QtQuick 2.15
import QtQuick.Controls 1.4 as SwitchGroup
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    AutoResize {
        fixedAspectRatio: false
        accordingToX: true
    }
    Component.onCompleted: {
        production.checked = true
    }

    signal signalLogin(var id)
    Rectangle{
        id: top
        width: 1440
        height: 50
        anchors.top: parent.top
        anchors.left: parent.left
        AutoResize {
            fixedAspectRatio: false
            accordingToX: true
        }
        Text {
            id: production1name
            x:20
            y:6
            width: 333
            height: 36
            text: qsTr("Reliability Testing System")
            color: "#3D7AB3"
            font.pixelSize:26
            onWidthChanged: {
                if(width > 333){
                    font.pixelSize = font.pixelSize * (width / 333)
                }
                else{
                    font.pixelSize = 26
                }
            }
        }
        RoundButton{
            id:logoutBtn
            width: 80
            height: 30
            text: "Logout"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
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
                signalLogin(login)
                ConfigurationQml.selectConfiguration()
            }
        }
    }

    Rectangle{
        id:centerSwitch
        width: 1440
        height: 48
        anchors.top: top.bottom
        color: "#EFEFEF"
        SwitchGroup.ExclusiveGroup { id: buttonGroup } //提供一个组给按钮绑定
        AutoResize {
            id: auto
            fixedAspectRatio: false
            accordingToX: true
        }
        CustomBtn{
            id:dashboard
            width: 144
            height: 48
            anchors.left: parent.left
            iconSrc:"qrc:/images/user.png"
            iconText: "Dashboard"
            exclusiveGroup: buttonGroup //绑定到组
            onWidthChanged: {
                if(width > 144){
                    iconid.font.pixelSize = iconid.font.pixelSize * (width / 144)
                }
                else{
                    iconid.font.pixelSize = 16
                }
            }
        }
        CustomBtn{
            id:production
            width: 154
            height: 48
            anchors.left: dashboard.right
            iconSrc:"qrc:/images/user.png"
            iconText: "Production"
            exclusiveGroup: buttonGroup //绑定到组
            onWidthChanged: {
                if(width > 154){
                    iconid.font.pixelSize = iconid.font.pixelSize * (width / 154)
                }
                else{
                    iconid.font.pixelSize = 16
                }
            }
        }
        CustomBtn{
            id:datalog
            width: 144
            height: 48
            anchors.left: production.right
            iconSrc:"qrc:/images/user.png"
            iconText: "Data Log"
            exclusiveGroup: buttonGroup //绑定到组
            onWidthChanged: {
                if(width > 144){
                    iconid.font.pixelSize = iconid.font.pixelSize * (width / 144)
                }
                else{
                    iconid.font.pixelSize = 16
                }
            }
        }
        CustomBtn{
            id:report
            width: 124
            height: 48
            anchors.left: datalog.right
            iconSrc:"qrc:/images/user.png"
            iconText: "Report"
            exclusiveGroup: buttonGroup //绑定到组
            onWidthChanged: {
                if(width > 124){
                    iconid.font.pixelSize = iconid.font.pixelSize * (width / 124)
                }
                else{
                    iconid.font.pixelSize = 16
                }
            }
        }
        CustomBtn{
            id:configuration
            width: 164
            height: 48
            anchors.left: report.right
            iconSrc:"qrc:/images/user.png"
            iconText: "Configuration"
            exclusiveGroup: buttonGroup //绑定到组
            onWidthChanged: {
                if(width > 164){
                    iconid.font.pixelSize = iconid.font.pixelSize * (width / 164)
                }
                else{
                    iconid.font.pixelSize = 16
                }
            }

        }
    }
    Connections{
        target: configuration
        function onIconClicked(text){
            myLoader.sourceComponent = configuration1
            ConfigurationQml.selectConfiguration()
        }
    }
    Connections{
        target: production
        function onIconClicked(text){
            myLoader.sourceComponent = production1
        }
    }
    // 1. Loader加载不同组件，实现切换页面的功能
    Loader{
        id:myLoader
        anchors.top:centerSwitch.bottom
        Component.onCompleted: {
            myLoader.sourceComponent = production1
        }
    }
    function switchPage(id){
        myLoader.sourceComponent = id
    }
    Component{
        id:production1;
        Production1{
            id:p1
            width: 1440;
            height: 802;
        }
    }
    Component{
        id:configuration1
        Configuration {
            id: c1
            width: 1440;
            height: 802;
        }
    }
}
