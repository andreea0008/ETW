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

    AddOrderItem {
        id: addOrderItem
        visibleBackArrow: true
        visibleAddButton: false
        onBack: stackViewJobs.pop()
    }

}
