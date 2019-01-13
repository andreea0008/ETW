import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"

Page {
    property Item topBar
Rectangle
{
    anchors.fill: parent
    color: "#0d0d0d"

    Column
    {
        anchors.fill: parent
        AppText
        {
            text: "Order #: "
        }
    }
}
}
