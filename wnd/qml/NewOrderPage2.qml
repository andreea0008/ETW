import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4
import "delegates"
import "styles"
import "components"

Page {
    id: pageNewOrder2
    property int margin: pageNewOrder2.width * 0.1
    property int spaceHeight: Theme.listItem.minimumHeight / 2
    property int minimumWidthText: width * 0.2

    onVisibleChanged:
    {
        if(visible)
            DecorationController.update()
    }

    Rectangle
    {
        anchors.fill: parent
        color: "#2b2b2b"
        Button
        {
            id: addNewItem
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: margin
            anchors.rightMargin: margin
            anchors.top: parent.top
            anchors.topMargin: margin/10

            text: "Add component"
            contentItem: Text {
                text: parent.text
                font.pixelSize: Theme.listItem.minimumHeight * 0.5
                opacity: enabled ? 1.0 : 0.3
                color: "#fff"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle
            {
                implicitHeight: 30
                implicitWidth: 100
                color: "#00b894"
                opacity: parent.pressed ? 0.8 : 1.0
            }

            onClicked:
            {
                addOrderItem.visibleAddButton = false
                stackViewOrders.push(Qt.resolvedUrl("NewOrderPage3.qml"))
            }
        }

        ListView
        {
            anchors.top: addNewItem.bottom
            anchors.topMargin: margin/10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            model: DecorationController
            clip: true
            delegate: DecorationDelegate {
                id: delegate
                color: "#0d0d0d"
                width: parent.width
                type: Type
                typeWindow: TypeWindow
                widthDecoration: Width
                heightDecoration: Height
                isCanRemove: false
                refRectPriority: false
                onPushToStackView: console.log("newOrderPage2")
            }
        }
    }
}
