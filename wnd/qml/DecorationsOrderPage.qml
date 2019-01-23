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
        ListView
        {
            anchors.fill: parent
            model: DecorationController
            clip: true
            spacing: 1
            delegate: DecorationDelegate {
                id: delegate
                color: "#0d0d0d"
                width: parent.width
                type: Type
                typeWindow: TypeWindow
                widthDecoration: Width
                heightDecoration: Height
                isCanRemove: false
            }
        }
    }
}
