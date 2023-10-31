import QtQuick 2.15
import QtQuick.Window 2.15
Window {
    id: hmain
    width: 1440;
    height: 900;
    visible: true

    Login{
        id: login
        width: 1440;
        height: 900;
    }
    Production1{
        id:production1
        width: 1440;
        height: 900;
    }
    Connections{
        target: production1
        function onSignalBackLogin(){
            login.visible = true
            production1.visible = false
        }
    }
}
