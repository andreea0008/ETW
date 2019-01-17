import VPlayApps 1.0
import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"


Page {

    ListView
    {
        id: list
        width: parent.width
        height: parent.height
        model: OrderController
        clip: true
        spacing: 1

        delegate: MainDelegate {
            id: delegate
            color: "#0d0d0d"
            width: parent.width
            isCanRemove: true
            refRectPriority: false
            client: Name
            address: City + " " + Street
            onPushToStackView:
            {
                console.log("open property order show")
                //                        OrderController.setCurrentInderOrder(index)
            }
        }
    }
}
