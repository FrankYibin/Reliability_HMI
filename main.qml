import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.9
import QtQuick.Dialogs 1.3
Window {
    id: hmain
    width: 1440 * multipleWidth
    height: 900 * multipleHeight
    visible: true
    title: "Reliability Testing System"
    property int productionIndex: 1
    property double multipleHeight: 1
    property double multipleWidth: 1
    property string initTime: ""
    property FontLoader fregular: FontLoader {
        source: "fonts/OpenSans-Regular.ttf"
    }
    property FontLoader fbold: FontLoader {
        source: "fonts/OpenSansBold.ttf"
    }
    x:0
    Loader{
        id:loader
        anchors.fill: parent
        asynchronous:true
        Component.onCompleted: {
             // multipleWidth = (Screen.desktopAvailableWidth / 1440)
             // multipleHeight = (Screen.desktopAvailableHeight / 900)
             // multipleWidth = multipleWidth.toFixed(2) - 0.01
             // multipleHeight = multipleHeight.toFixed(2) - 0.01
            loader.sourceComponent = reliabilityTestingSystem
        }
        Connections{
            target: loader.item
            function onSignalLogin(id){
                loader.sourceComponent = id
            }
        }
    }

    Component{
        id:login
        Login{
            width: 1440* multipleWidth
            height: 900* multipleHeight
        }
    }
    Component{
        id:reliabilityTestingSystem
        ReliabilityTestingSystem{
            width: 1440* multipleWidth
            height: 900* multipleHeight
        }
    }
    Rectangle{
        id: pop
        opacity: 0.5
        color: "#BBBBBB"
        visible: false
        anchors.fill: parent
    }
    MessageDialog {
        id: messageDialog
        title: "Warning"
        text: "Welder is still running!"
        standardButtons: StandardButton.Yes
        icon: StandardIcon.Warning
    }
    //    @disable-check M16
    onClosing: function(closeevent){
        //CloseEvent的accepted设置为false就能忽略该事件
        if(opcua.mStart1 === false && opcua.mStart2 === false && opcua.mStart3 === false && opcua.mStart4 === false){
            opcua.Stop()
            opcFacility1.disconnectOpc()
            opcFacility2.disconnectOpc()
            opcFacility3.disconnectOpc()
            opcFacility4.disconnectOpc()
            Qt.quit()
        }
        else{
            messageDialog.visible = true
        }
        closeevent.accepted = false
    }
}
