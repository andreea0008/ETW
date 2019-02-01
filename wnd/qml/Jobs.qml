import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"
import "general"

Page {
    General{id: general}

//    Rectangle
//    {
//        anchors.fill: parent
//        color: general.white
//    }
    StackView{
        id: stackViewJobs
        anchors.fill: parent

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

                delegate: JobDelegate {
                    id: delegate

                    color: general.green
                    width: parent.width
                    isCanRemove: false
                    refRectPriority: false
                    client: Name
                    address: Address
                    phone: Phone
                    onPushToStackView:
                    {
                        stackViewJobs.push(Qt.resolvedUrl("JobsPotential.qml"), {name : Name, address : Address, phone : Phone})
                    }
                }
            }
        }
        function releaseStack(){
            if(stackViewJobs.depth > 1){
                stackViewJobs.pop()
                releaseStack();
            }
        }
    }
}
