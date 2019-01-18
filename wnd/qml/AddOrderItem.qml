import VPlayApps 1.0
import QtQuick 2.0
import QtGraphicalEffects 1.0
Rectangle
{
    id: addOrderItem
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: Theme.listItem.minimumHeight
    property bool visibleBackArrow: false
    property bool visibleAddButton: true

    signal addNewOrder()
    signal back()
    Item
    {
        id: itemAddButton
        anchors.right: parent.right
        anchors.rightMargin: parent.height / 2
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height * 0.6
        width: height
        visible: true
    Rectangle{
        id: rectForImage
        anchors.fill: parent
        color: "white"
        radius: width /2
    }
    
    RectangularGlow {
        id: effect
        anchors.fill: rectForImage
        glowRadius: 5
        spread: 0.15
        color: "#0d0d0d"
        cornerRadius: rectForImage.radius + glowRadius
    }
    
    Rectangle{
        id: rectMain
        anchors.centerIn: parent
        height: parent.height
        width: height
        color: "white"
        radius: width /2
        Image
        {
            anchors.fill: parent
            anchors.margins: 5
            source: //"../qml/images/plus (2).png"
                    addImageMouseArea.pressed
                    ?  "../qml/images/plus_white.png"
                    :  "../qml/images/plus_black.png"
            antialiasing: true
            MouseArea
            {
                id: addImageMouseArea
                anchors.fill: parent
                onPressed: rectMain.color = "#576574"
                onReleased: {
                    rectMain.color = "#fff"
                    console.log("You wanna add new order")
                    addNewOrder()
                }
            }
        }
    }
}

    //back arrow
Item
{
    anchors.left: parent.left
    anchors.leftMargin: parent.height / 2
    anchors.verticalCenter: parent.verticalCenter
    height: parent.height * 0.6
    width: height
    visible: visibleBackArrow
    Rectangle{
        id: rectForBackArrowImage
        anchors.fill: parent
        color: "white"
        radius: width /2
    }

    RectangularGlow {
        id: effectBackArrow
        anchors.fill: rectForBackArrowImage
        glowRadius: 5
        spread: 0.15
        color: "#0d0d0d"
        cornerRadius: rectForBackArrowImage.radius + glowRadius
    }

    Rectangle{
        id: rectMainForBackArrow
        anchors.centerIn: parent
        height: parent.height
        width: height
        color: "white"
        radius: width /2
        Image
        {
            anchors.fill: parent
            anchors.margins: 5
            source: backArrowImageMouseArea.pressed
                    ?  "../qml/images/back_white.png"
                    :  "../qml/images/back_black.png"
            antialiasing: true
            MouseArea
            {
                id: backArrowImageMouseArea
                anchors.fill: parent
                onPressed: rectMainForBackArrow.color = "#576574"
                onReleased: {
                    rectMainForBackArrow.color = "#fff"
                    console.log("You wanna back")
                    back()
                }
            }
        }
    }

}
}
