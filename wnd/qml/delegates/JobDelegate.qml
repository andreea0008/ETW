import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../components"
import "../general"


Rectangle{
    id: delegate
    radius: height * 0.1
    height: column.height

    property bool isRemoveRectVisible: false
    property bool isCanRemove: false
    property alias refRectPriority: rectPriority.visible
    property string client: "CLIENT"
    property string address: "Address"
    property string phone: "Phone"

    signal pushToStackView()

    Item{
        id: row
        anchors.left: parent.left
        anchors.right: rectRemoveButton.left
        height: parent.height
        
        Item{
            id: itemPriority
            width: parent.width * 0.1
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            
            Rectangle{
                id: rectPriority
                anchors.centerIn: parent
                width: parent.width /2
                height: width
                color: "red"
                radius: width/2
            }
            
        }

        Column{
            id: column
            anchors.left: itemPriority.right
            anchors.right: parent.right
            height: nameCustomer.height * 3

            InfoCustomerComponent {
                id: nameCustomer
                anchors.left: parent.left
                anchors.right: parent.right
                sourceImage: "../images/avatar.png"
                textComponent: client
                textBold: true
                textItalic: false
            }
            
            InfoCustomerComponent {
                id: addressAppText
                anchors.left: parent.left
                anchors.right: parent.right
                sourceImage: "../images/location.png"
                textComponent: address
                textBold: false
                textItalic: false
            }

            InfoCustomerComponent {
                id: phoneAppText
                anchors.left: parent.left
                anchors.right: parent.right
                sourceImage: "../images/telephone.png"
                textComponent: phone
                textBold: false
                textItalic: true
            }
        }

        MouseArea{
            anchors.fill: parent
            visible: delegate.isRemoveRectVisible
            onReleased:
                if(delegate.isRemoveRectVisible)
                    delegate.isRemoveRectVisible = false
        }

        MouseArea{
            anchors.fill: parent
            visible: !delegate.isRemoveRectVisible
            hoverEnabled: true
            onExited:
            {
                if(delegate.opacity === 0.8)
                    delegate.opacity = 1.0
            }
            
            onPressed: {
                console.log("pressed_delegate")
                if(!delegate.isRemoveRectVisible){
                    delegate.opacity = 0.8
                    if(isCanRemove)
                        timerRemoveOrders.start()
                }
            }
            onReleased: {
                delegate.opacity = 1.0
                timerRemoveOrders.stop()
                if(!delegate.isRemoveRectVisible)
                    pushToStackView()
            }
        }
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
