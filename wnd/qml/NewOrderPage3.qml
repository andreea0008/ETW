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
    Rectangle
    {
        anchors.fill: parent
        color: "#2b2b2b"
        Button
        {
            id: saveItemButton
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: margin
            anchors.rightMargin: margin
            anchors.top: parent.top
            anchors.topMargin: margin/10

            text: "Save"
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
                stackViewOrders.pop()
            }
        }



        Column
        {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: saveItemButton.bottom
            anchors.topMargin: margin/10
            anchors.leftMargin: margin
            anchors.rightMargin: margin
            anchors.bottomMargin: margin
            RowLayout
            {
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "Width:"
                    Layout.minimumWidth: minimumWidthText
                }

                ComboBox
                {
                    Layout.fillWidth: true
                    model: ["Door", "Window", "Garage door"]
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
                    text: "Width:"
                    Layout.minimumWidth: minimumWidthText
                }

                ComboBox
                {
                    Layout.fillWidth: true
                    model: ["1", "2", "4"]
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
                    text: "Width:"
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    Layout.fillWidth: true
                    color: "white"
                    placeholderText: "Width"
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
                    text: "Height:"
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    Layout.fillWidth: true
                    color: "white"
                    placeholderText: "Height"
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
                    text: "Description:"
                    Layout.minimumWidth: minimumWidthText
                }

                TextField
                {
                    Layout.fillWidth: true
                    color: "white"
                    placeholderText: "Description"
                    background: TextFieldStayle {}
                }
            }
        }
    }
}
