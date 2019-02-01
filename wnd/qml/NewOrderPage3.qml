import VPlayApps 1.0
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4
import "delegates"
import "styles"
import "components"
import "general"

Page {
    id: pageNewOrder2
    property int margin: pageNewOrder2.width * 0.1
    property int spaceHeight: Theme.listItem.minimumHeight / 2
    property int minimumWidthText: width * 0.2
    property string idOrder: ""
    General { id: general }

    Rectangle
    {
        anchors.fill: parent
        color: general.white

        Column
        {
            anchors.fill: parent
            anchors.margins: margin

            RowLayout
            {
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "Type"
                    Layout.minimumWidth: minimumWidthText
                    color: general.black
                }

                SelectComboBox {
                    id: typeWindowOrDoor
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    currentIndex: 0
                    model: ["Vinyl window", "Entry door", "Patio door", "Garage door"]
                }
            }

            Item{
                visible: typeWindowOrDoor.currentIndex == 0
                height: spaceHeight
                width: parent.width
            }

            RowLayout
            {
                visible: typeWindowOrDoor.currentIndex == 0
                anchors.left: parent.left
                anchors.right: parent.right
                AppText
                {
                    text: "Wnd. type"
                    Layout.minimumWidth: minimumWidthText
                    color: general.black
                }

                SelectComboBox {
                    id: typeWindowComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    model: ["Awning window", "Bay window", "Bow window", "Double slider window"]
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
                    text: "Width "
                    Layout.minimumWidth: minimumWidthText
                    color: general.black
                }

                TextField
                {
                    id: widthTextField
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
                    text: "Height "
                    Layout.minimumWidth: minimumWidthText
                    color: general.black
                }

                TextField
                {
                    id: heightTextField
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
                    color: general.black
                }
            }

            Rectangle{
                anchors.right: parent.right
                anchors.left: parent.left
                height: Theme.listItem.minimumHeight * 3
                DescriptionTextArea {
                    id: descriptionTextArea
                    anchors.fill: parent
                    height: 200
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
                Button
                {
                    id: saveItemButton
                    Layout.fillWidth: true
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
                        color: general.green
                        opacity: parent.pressed ? 0.8 : 1.0
                    }

                    onClicked:
                    {
                        DecorationController.addDecoration(typeWindowOrDoor.currentText,
                                                           typeWindowComboBox.visible ? typeWindowComboBox.currentText : "",
                                                           widthTextField.text,
                                                           heightTextField.text,
                                                           descriptionTextArea.text)
                        DecorationController.update();
                        stackViewOrders.pop()
                    }
                }
            }
        }
    }
}
