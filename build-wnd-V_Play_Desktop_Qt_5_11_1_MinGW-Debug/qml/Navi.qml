import VPlayApps 1.0
import QtQuick 2.0
import "delegates"
import "styles"
Page {
    id: page
    useSafeArea: true

    Navigation
    {
        navigationMode: navigationModeTabs

        NavigationItem{
            title: "Job"
            icon: IconType.list

            Jobs
            {

            }
        }

        NavigationItem{
            title: "Messager"
            icon: IconType.mailforward
            ListPage {
                title: parent.title
                emptyText.text: qsTr("No contacts.")
            }
        }

        NavigationItem{
            title: "Add order"
            icon: IconType.thlarge
            onActiveChanged:  console.log("active focus change")
            Orders
            {

            }
        }

        NavigationItem {
            id: settingsItem
            title: qsTr("Settings")
            icon: IconType.cog
        }
    }
}
