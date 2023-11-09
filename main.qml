import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
// import ConfigurationQml 1.0
Window {
    id: hmain
    width: 1440 * multipleWidth
    height: 900 * multipleHeight
    visible: true
    property double multipleHeight: 1
    property double multipleWidth: 1
//    property FontLoader bold: FontLoader {
//        source: "D:/Branson/Reliability_HMI/font/OpenSans-Bold.ttf"
//        name: "bold"
//    }
//    property FontLoader regular: FontLoader {
//        source: "font/OpenSans-Regular.ttf"
//    }
    // ConfigurationQml{
    //     id:cconfigurationQml
    // }
    x:0
    Loader{
        id:loader
        anchors.fill: parent
        asynchronous:true
        Component.onCompleted: {
//            console.log(opcua.start1())
            multipleWidth = (Screen.desktopAvailableWidth / 1440)
            multipleHeight = (Screen.desktopAvailableHeight / 900)
            multipleWidth = multipleWidth.toFixed(2) - 0.01
            multipleHeight = multipleHeight.toFixed(2) - 0.01
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
}
