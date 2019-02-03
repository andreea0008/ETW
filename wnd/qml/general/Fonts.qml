import QtQuick 2.9

QtObject {
    property alias refRobotoBold: robotoBold.source
    /*readonly property font robotoBold: */
//    FontLoader{
//        name: robotoBold
//        source: "../fonts/Roboto-Bold.ttf"
//    }
//    robotoBold.source
//    readonly property alias robotoMedium: robotoMedium.source
//    readonly property alias robotoBlack: robotoBlack.source



    FontLoader{
        name: robotoMedium
        source: "../fonts/Roboto-Medium.ttf"
    }

    FontLoader{
        name: robotoBlack
        source: "../fonts/Roboto-Black.ttf"
    }
}
