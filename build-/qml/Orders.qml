import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"

Page {
    AddOrderItem {
        id: addOrderItem
        visibleBackArrow: stackViewOrders.depth > 1
        visibleAddButton: stackViewOrders.depth < 2

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
            if(!visible) releaseStack(stackViewOrders)
        }
        initialItem: Rectangle{
            width: parent.width
            height: parent.height
            color: "#2b2b2b"

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
                        OrderController.setCurrentInderOrder(index)
                    }
                }
            }
        }
        function releaseStack(stackView){
            if(stackView.depth > 1){
                stackView.pop()
                releaseStack();
            }
        }
    }
}
