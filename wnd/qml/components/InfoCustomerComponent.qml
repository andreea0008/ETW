import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2

Row
{
    height: (!Theme.listItem ? Theme.listItem.minimumHeight : 24) * 1.5
    spacing: (!Theme.listItem ? Theme.listItem.minimumHeight : 24) / 2
    property string textComponent: ""
    property string sourceImage: "../images/location.png"
    property bool textItalic: false
    property bool textBold: false
    property real koefPixelSize: 1.0
    property int pixelHeight: (!Theme.listItem ? Theme.listItem.minimumHeight : 24) * koefPixelSize
    property bool isPhone: false

    Item{
        anchors.verticalCenter: parent.verticalCenter
        height:  !Theme.listItem ? Theme.listItem.minimumHeight : 24
        width: height
        Image {
            anchors.fill: parent
            anchors.margins: parent.height * 0.1
            source: sourceImage
            antialiasing: true
        }
    }
    AppText
    {
        id: customerAppText
        anchors.verticalCenter: parent.verticalCenter
        height: !Theme.listItem ? Theme.listItem.minimumHeight : 24
        color: "white"
        text: textComponent
        font.bold: textBold
        font.italic: textItalic
        font.pixelSize: pixelHeight
        MouseArea
        {
            anchors.fill: parent
            visible: isPhone
            onPressAndHold:{
                console.log("call___")
                Qt.openUrlExternally("tel:%1".arg(customerAppText.text))
            }
        }
    }
}
