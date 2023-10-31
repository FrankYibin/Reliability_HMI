import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    id: hmain
    width: 1440;
    height: 900;
    visible: true
    Loader{
        id:loader
        anchors.fill: parent
        Component.onCompleted: {
            loader.sourceComponent = login
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
            id: aaa
            width: 1440;
            height: 900;
        }
    }
    Component{
        id:reliabilityTestingSystem
        ReliabilityTestingSystem{
            width: 1440;
            height: 900;
        }
    }



//    Login{
//        width: 1440;
//        height: 900;
//    }
//    Production1{
//        id:production1
//        width: 1440;
//        height: 900;
//    }
//    Configuration{
//        id:configuration
//        width: 1440;
//        height: 802;
//    }


//    Connections{
//        target: production1
//        function onSignalBackLogin(){
////            login.visible = true
////            production1.visible = false
//        }
//    }
}
