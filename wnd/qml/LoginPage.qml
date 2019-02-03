import VPlayApps 1.0
import VPlay 2.0
import QtQuick 2.0
import QtQuick.Layouts 1.1
import "general"

Page {
    id: loginPage    
    signal loginSucceeded

    // login form background
    Rectangle {
        id: loginForm
        anchors.centerIn: parent
        color: "#158f43"
        width: content.width + dp(48)
        height: content.height + dp(16)
    }

    // login form content
    GridLayout {
        id: content
        anchors.centerIn: parent
        columnSpacing: dp(20)
        rowSpacing: dp(10)
        columns: 2

        // headline
        AppText {
            Layout.topMargin: dp(8)
            Layout.bottomMargin: dp(12)
            Layout.columnSpan: 2
            Layout.alignment: Qt.AlignHCenter
            color: general.white
            text: "Login"
        }

        // email text and field
        AppText {
            text: qsTr("E-mail")
            font.pixelSize: sp(12)
            color: general.white
        }

        AppTextField {
            id: txtUsername
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            backgroundColor: general.white
            borderColor: general.black
            textColor: general.black
            radius: 2
            borderWidth: 1
        }

        // password text and field
        AppText {
            text: qsTr("Password")
            font.pixelSize: sp(12)
            color: general.white
        }

        AppTextField {
            id: txtPassword
            Layout.preferredWidth: dp(200)
            showClearButton: true
            font.pixelSize: sp(14)
            backgroundColor: general.white
            borderColor: general.black
            textColor: general.black
            borderWidth: 1
            radius: 2
            echoMode: TextInput.Password
        }

        // column for buttons, we use column here to avoid additional spacing between buttons
        Column {
            Layout.fillWidth: true
            Layout.columnSpan: 2
            Layout.topMargin: dp(12)

            // buttons
            AppButton {
                text: qsTr("Login")
                textColor: general.white
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    loginPage.forceActiveFocus() // move focus away from text fields

                    // simulate successful login
                    console.debug("logging in ...")
                    loginSucceeded()
                }
            }
        }
    }

}
