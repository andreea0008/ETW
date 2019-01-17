import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"

Page {
    Rectangle
    {
        anchors.fill: parent
        color: "#2b2b2b"
    }
    ListView
    {
        id: list
        width: parent.width
        height: parent.height
        model: OrderController
        clip: true
        spacing: 1

        delegate: JobDelegate {
            id: delegate
            color: "#0d0d0d"
            width: parent.width
            isCanRemove: false
            refRectPriority: false
            client: Name
            address: Address
            phone: Phone
        }
    }
}
