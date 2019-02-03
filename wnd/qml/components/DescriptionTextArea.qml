import VPlayApps 1.0
import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../general"
TextArea
{
    anchors.fill: parent
    style: TextAreaStyle {

        textColor: general.black
        selectionColor: general.green
        selectedTextColor: general.white
        backgroundColor: general.white
    }
    font.pixelSize: 20
}



