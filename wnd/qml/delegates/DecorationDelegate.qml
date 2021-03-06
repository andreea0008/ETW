import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Rectangle{
    id: delegate
    radius: height * 0.1
    height: column.height

    property bool isRemoveRectVisible: false
    property bool isCanRemove: false
    property string type: ""
    property string typeWindow: ""
    property string widthDecoration: "0"
    property string heightDecoration: "0"

    signal pushToStackView()

    Item{
        id: row
        anchors.left: parent.left
        anchors.right: rectRemoveButton.left
        height: parent.height
        
       Column{
            id: column
            anchors.fill: parent
            anchors.leftMargin: !Theme.listItem ? Theme.listItem.minimumHeight : 42
            anchors.rightMargin: !Theme.listItem ? Theme.listItem.minimumHeight : 42
            height: typeWindowAppText.length !== 0 ? (typeAppText.height *3 ) : typeAppText.height * 2

            AppText
            {
                id: typeAppText
                height: !Theme.listItem ? Theme.listItem.minimumHeight : 42
                color: general.white
                text: type
                verticalAlignment: Text.AlignVCenter
                MouseArea{
                    anchors.fill: parent
                    onPressed:    console.log(typeAppText.height, typeWindowAppText.height, widthAndHeight.height,
                                                               typeWindow.length != 0, typeWindow.length, typeWindow)
                }
            }
            
            AppText
            {
                id: typeWindowAppText
                visible: typeWindow.length !== 0
                color: general.white
                text: typeWindow
                verticalAlignment: Text.AlignVCenter
            }

            Item
            {
                id: widthAndHeight
                width: parent.width
                height: !Theme.listItem ? Theme.listItem.minimumHeight : 42

                Item{
                    anchors.left: parent.left
                    anchors.right: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    AppText
                    {
                        anchors.centerIn: parent
                        color: general.white
                        text: "W: " + widthDecoration
                    }
                }
                Item{
                    anchors.left: parent.horizontalCenter
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    AppText
                    {
                        anchors.centerIn: parent
                        color: general.white
                        text: "H:" +  heightDecoration
                    }
                }
            }
        }

       MouseArea
       {
           anchors.fill: parent
           onClicked: console.log(column.height, typeAppText.height, typeWindowAppText.height, widthAndHeight.height,
                                  typeWindow.length != 0, typeWindow.length, typeWindowAppText.length)
       }

//        MouseArea{
//            anchors.fill: parent
//            visible: delegate.isRemoveRectVisible
//            onReleased:
//                if(delegate.isRemoveRectVisible)
//                            delegate.isRemoveRectVisible = false
//        }
//        MouseArea{
//            anchors.fill: parent
//            visible: !delegate.isRemoveRectVisible
//            hoverEnabled: true
//            onExited:
//            {
//                if(delegate.opacity === 0.8)
//                    delegate.opacity = 1.0
//            }
            
//            onPressed: {
//                if(!delegate.isRemoveRectVisible){
//                    delegate.opacity = 0.8
//                    if(isCanRemove)
//                        timerRemoveOrders.start()
//                }
//            }
//            onReleased: {
//                delegate.opacity = 1.0
//                timerRemoveOrders.stop()
//                if(!delegate.isRemoveRectVisible)
//                    pushToStackView()

//            }
//        }
    }

    Rectangle
    {
        id: rectRemoveButton
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: height
        color: "#ff3838"
        
        visible: delegate.isRemoveRectVisible
        
        Image{
            anchors.centerIn: parent
            width: parent.width * 0.8
            height: width
            source: "../../qml/images/back_black.png"
            MouseArea{
                anchors.fill: parent
                onReleased: console.log("you want remove order")
            }
        }        
        state: "shown"
        states: [
            State {
                name: "shown"
                when: delegate.isRemoveRectVisible
                PropertyChanges { target: rectRemoveButton; width: rectRemoveButton.height }
            },
            State {
                name: "hidden"
                when: !delegate.isRemoveRectVisible
                PropertyChanges { target: rectRemoveButton; width: 0 }
            }
        ]
        transitions: Transition {
            PropertyAnimation { property: "width"; duration: 500; easing.type: Easing.InOutQuad }
        }
    }    

    Timer{
        id: timerRemoveOrders
        interval: 2000
        onTriggered: {
            console.log("timer triggered")
            timerRemoveOrders.stop()
            delegate.isRemoveRectVisible = true
        }
    }
}
