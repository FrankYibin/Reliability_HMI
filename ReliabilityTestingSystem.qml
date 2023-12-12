import QtQuick 2.15
import QtQuick.Controls 1.4 as SwitchGroup
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Rectangle {
    Component.onCompleted: {
        production.checked = true
    }

    signal signalLogin(var id)
    Rectangle{
        id: top
        width: multipleWidth* 1440
        height: multipleHeight* 50
        anchors.top: parent.top
        anchors.left: parent.left
        Text {
            id: production1name
            x: multipleWidth*20
            y: multipleHeight*6
            width: multipleWidth* 333
            height: multipleHeight* 36
            text: qsTr("Reliability Testing System")
            color: "#3D7AB3"
            font.pixelSize: multipleWidth*26
            font.family: fbold.name
        }
        RoundButton{
            id:logoutBtn
            width: multipleWidth* 80
            height: multipleHeight* 30
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
                font.pixelSize: multipleWidth* 14
                font.family: fregular.name
            }
            onClicked: {
                signalLogin(login)
            }
        }
    }

    Rectangle{
        id:centerSwitch
        width: multipleWidth* 1440
        height: multipleHeight* 48
        x: multipleWidth*0
        y: multipleHeight*50
        color: "#EFEFEF"
        SwitchGroup.ExclusiveGroup { id: buttonGroup } //提供一个组给按钮绑定

        CustomBtn{
            id:dashboard
            width: multipleWidth* 144
            height: multipleHeight* 48
            anchors.left: parent.left
            iconSrc:"images/dashboard.png"
            iconText: "Dashboard"
            exclusiveGroup: buttonGroup //绑定到组
        }
        CustomBtn{
            id:production
            width: multipleWidth* 154
            height: multipleHeight* 48
            anchors.left: dashboard.right
            iconSrc:"images/监控.png"
            iconText: "Production"
            exclusiveGroup: buttonGroup //绑定到组
        }
        CustomBtn{
            id:datalog
            width: multipleWidth* 144
            height: multipleHeight* 48
            anchors.left: production.right
            iconSrc:"images/表格.png"
            iconText: "Data Log"
            exclusiveGroup: buttonGroup //绑定到组
        }
        CustomBtn{
            id:report
            width: multipleWidth* 124
            height: multipleHeight* 48
            anchors.left: datalog.right
            iconSrc:"images/report (1).png"
            iconText: "Report"
            exclusiveGroup: buttonGroup //绑定到组
        }
        CustomBtn{
            id:configuration
            width: multipleWidth* 164
            height: multipleHeight* 48
            anchors.left: report.right
            iconSrc:"images/设置.png"
            iconText: "Configuration"
            exclusiveGroup: buttonGroup //绑定到组
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
        id:configuration1
        Configuration {
            id: c1
            width: multipleWidth* 1440;
            height: multipleHeight* 802;
        }
    }
    Component{
        id:production1;
        Production1{
            id:p1
            width: multipleWidth* 1440;
            height: multipleHeight* 802;
        }
    }
}
