import VPlayApps 1.0
import VPlay 2.0
import QtQuick 2.0
import "general"

GameWindow {
    // You get free licenseKeys from https://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://v-play.net/licenseKey>"

    FontLoader { id: normalFont; source: "fonts/Roboto-Regular.ttf" }

    onInitTheme: {
         // Set the status bar style to white (light style)
         Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite
//          Set the navigation bar background to blue
         Theme.navigationBar.backgroundColor = "#2b2b2b"
         Theme.navigationBar.titleColor = "white"
         Theme.navigationBar.dividerColor = "#2b2b2b"
        Theme.navigationBar.height = 0
         // Set the background color, which is used as background color of pages
         Theme.colors.backgroundColor = "#222"

         // Set the global text color to white
         Theme.colors.textColor = "white"
        //set font
        Theme.normalFont = normalFont
       }

    LoginPage
    {
        onLoginSucceeded: mainNavigationStack.visible = true
    }

    NavigationStack {
        id: mainNavigationStack
        visible: false
        Navi
        {
            id: navi
        }
    }
}
