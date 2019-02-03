import VPlayApps 1.0
import QtQuick 2.9
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0

ComboBox {
    id: box
    currentIndex: 2
    activeFocusOnPress: true
    style: ComboBoxStyle {
        id: comboBox
        background: Rectangle {
            id: rectCategory
            border.width: 1
            border.color: general.green
            color: general.white
        }
        label: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            color: general.black
            text: control.currentText
        }

        // drop-down customization here
        property Component __dropDownStyle: MenuStyle {
            __maxPopupHeight: 600
            __menuItemType: "comboboxitem"

            frame: Rectangle {              // background
                color: "#0d0d0d"
                radius: 0
            }

            itemDelegate.label:             // an item text
                Text {
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 15
                font.family: "Courier"
                font.capitalization: Font.SmallCaps
                color: "white"
                text: styleData.text
            }

            itemDelegate.background: Rectangle {  // selection of an item
                radius: 2

                color: styleData.selected ? "darkGray" : "transparent"
            }

            __scrollerStyle: ScrollViewStyle { }
        }

        property Component __popupStyle: Style {
            property int __maxPopupHeight: 400
            property int submenuOverlap: 0

            property Component frame: Rectangle {
                width: (parent ? parent.contentWidth : 0)
                height: (parent ? parent.contentHeight : 0) + 2
                border.color: "black"
                property real maxHeight: 500
                property int margin: 1
            }

            property Component menuItemPanel: Text {
                text: "NOT IMPLEMENTED"
                color: "red"
                font {
                    pixelSize: 14
                    bold: true
                }
            }

            property Component __scrollerStyle: null
        }
    }

    width: 200
}
