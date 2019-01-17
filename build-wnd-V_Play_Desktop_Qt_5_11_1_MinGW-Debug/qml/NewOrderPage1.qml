import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4
import "delegates"
import "styles"

Page {
    id: pageNewOrder1
    property int margin: pageNewOrder1.width * 0.1
    property int spaceHeight: Theme.listItem.minimumHeight / 2
    property int minimumWidthText: width * 0.2

    Rectangle
    {
        anchors.fill: parent
        color: "#2b2b2b"

        Column
        {
            anchors.fill: parent
            anchors.margins: margin
            AppText
            {
                id: orderId
                text: parent.generateOrderNumber()
            }

            Item{
                height: spaceHeight
                width: parent.width
            }

            RowLayout
            {
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "Name:"
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    id: nameClientTextField
                    Layout.fillWidth: true
                    color: "white"
                    placeholderText: "Name client"
                    background: TextFieldStayle {}
                    onTextChanged: orderId.text = parent.parent.generateOrderNumber();
                }
            }

            Item{
                height: spaceHeight
                width: parent.width
            }

            RowLayout
            {
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "Street: "
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    id: streetTextField
                    Layout.fillWidth: true
                    color: "white"
                    placeholderText: "Street of client"
                    background: TextFieldStayle {}

                }
            }

            Item{
                height: spaceHeight
                width: parent.width
            }

            RowLayout
            {
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "City: "
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    id: cityTextField
                    Layout.fillWidth: true
                    placeholderText: "City of client"
                    color: "white"
                    background: TextFieldStayle {}
                }
            }

            Item{
                height: spaceHeight
                width: parent.width
            }

            RowLayout
            {
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "Phone: "
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    id: phoneTextField
                    Layout.fillWidth: true
                    color: "white"
                    placeholderText: "+1-333-444-5555"
                    background: TextFieldStayle {}
                }
            }

            Item{
                height: spaceHeight
                width: parent.width
            }

            Button
            {
                anchors.left: parent.left
                anchors.right: parent.right
                height: Theme.listItem.minimumHeight
                text: "Next"
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
                    OrderController.addOrder(orderId.text, nameClientTextField.text,
                                             cityTextField.text, streetTextField.text,
                                             phoneTextField.text)
                    addOrderItem.visibleAddButton = false
                    stackViewOrders.push(Qt.resolvedUrl("NewOrderPage2.qml"))
                }
            }

            function generateOrderNumber()
            {
                var today = new Date();
                var dd = today.getDate();
                var textOrder = "Order #: " + new Date().toJSON().slice(0,10).replace(/-/g,'/') + nameClientTextField.text;
                return textOrder
            }
        }
    }
}
