import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4
import "../delegates"
import "../styles"

Button {
    anchors.left: parent.left
    anchors.right: parent.right
    background: {
        implicitHeight: 30
        implicitWidth: 100
        color: "#00b894"
        opacity: parent.pressed ? 0.8 : 1.0
    }
    contentItem: {
        text: parent.text
        opacity: enabled ? 1.0 : 0.3
        color: "#fff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    height: Theme.listItem.minimumHeight
    text: "Next"
}
