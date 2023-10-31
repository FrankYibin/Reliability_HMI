import QtQuick 2.7
import QtQuick.Controls 1.0
import QtQuick.Controls 2.2 as Controls2


Controls2. Menu {
    id: insertMenu
    width: 124
    height: 36
    Controls2. MenuItem {
        width: 124
        height: 36
        Rectangle{
            id:box
            anchors.fill: parent
            color: "#035E88"
        }
    }
}
