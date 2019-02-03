import VPlayApps 1.0
import QtQuick 2.0
import "delegates"
import "styles"
import "general"
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
                emptyText.text: qsTr("In process...")
            }
        }

        NavigationItem{
            title: "Order"
            icon: IconType.thlarge
            Orders
            {

            }
        }

        NavigationItem {
            id: settingsItem
            title: qsTr("Settings")
            icon: IconType.cog
            ListPage {
                title: parent.title
                emptyText.text: qsTr("In process...")
            }
        }
    }
}
