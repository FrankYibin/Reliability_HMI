import QtQuick 2.0
import QtQuick.Controls 1.4
Rectangle {
    id: custombtn
    height: multipleHeight* 50
    width: parent.width
    signal iconClicked(string text)
    property alias iconSrc: icon.source
    property alias iconText: iconLabel.text
    property alias iconid:iconLabel
    property bool checked: false
    property ExclusiveGroup exclusiveGroup: null //对外开放一个ExclusiveGroup接口，用于绑定同个组

    onExclusiveGroupChanged: {
        if (exclusiveGroup) {
            exclusiveGroup.bindCheckable(custombtn)
        }
    }
    //如果少了这个信号处理，则无法出现互斥效果
    onCheckedChanged: {
        checked ? custombtn.color = "#E6F7FF" : custombtn.color = "#EFEFEF"
        checked ? bottomline.visible = true : bottomline.visible = false
    }
    color: "#EFEFEF"
    Image {
        id: icon
        anchors.left: parent.left
        anchors.leftMargin: multipleWidth*10
        anchors.verticalCenter: parent.verticalCenter
        width: 30
        height: 30
    }
    Text {
        id: iconLabel
        color: "#3D7AB3"
        font.pixelSize: multipleWidth* 16
        elide: Text.ElideRight
        width: multipleWidth* parent.width-icon.width +60
        anchors.left: icon.right
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.family: fregular.name
    }
    Rectangle{
        id:bottomline
        width: parent.width
        height: multipleHeight* 2
        anchors.bottom: parent.bottom
        color: "#3D7AB3"
        visible: false
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        onClicked:{
            checked = true
            iconClicked(iconLabel.text)
        }
    }
}
