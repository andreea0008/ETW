import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"
import "general"

Page {
    property alias refStackViewOrders: stackViewOrders

    General { id: general }
    AddOrderItem {
        id: addOrderItem
        visibleBackArrow: stackViewOrders.depth > 1
        visibleAddButton: stackViewOrders.depth < 2

        onBack: stackViewOrders.pop()
        onAddNewOrder:
        {
            stackViewOrders.push(Qt.resolvedUrl("NewOrderPage1.qml"))
        }
    }

    StackView{
        id: stackViewOrders
        anchors.fill: parent
        anchors.topMargin: addOrderItem.height

        signal parametersOrder(var type, var typeWindow, var width, var height, var description);


        onVisibleChanged:
        {
            if(!visible)
                releaseStack()
        }
        initialItem: Rectangle{
            width: parent.width
            height: parent.height
            color: general.white

            ListView
            {
                id: list
                width: parent.width
                height: parent.height
                model: OrderController
                clip: true
                spacing: 1


                delegate: OrderDelegate {
                    id: delegate
                    color: general.green
                    width: parent.width
                    isCanRemove: true
                    refRectPriority: false
                    client: Name
                    address: City + " " + Street
                    onPushToStackView:
                    {
                        console.log("open property order show")
                        OrderController.setCurrentInderOrder(index)
                        DecorationController.update()
                        stackViewOrders.push(Qt.resolvedUrl("DecorationsOrderPage.qml"))
                    }
                }
            }
        }
        function releaseStack(){
            if(stackViewOrders.depth > 1){
                stackViewOrders.pop()
                releaseStack();
            }
        }
    }
}
