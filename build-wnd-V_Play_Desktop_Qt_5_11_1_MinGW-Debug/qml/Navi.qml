import VPlayApps 1.0
import QtQuick 2.0

Page {
    id: page
    useSafeArea: true

    Navigation
    {
        navigationMode: navigationModeTabs

        NavigationItem{
            title: "Job"
            icon: IconType.list
            ListView {
              model: 10
              anchors.fill: parent
              spacing: 1
              delegate:
                  Rectangle{
                  id: delegate
                  width: parent.width
                  height: column.height
                  color: "#0d0d0d"
                  radius: height * 0.1


                  Item{
                      id: row
                      anchors.left: parent.left
                      anchors.right: parent.right
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
                          height: dateAppText.height + addressAppText.height
                          AppText
                          {
                              id: dateAppText
                              height: !Theme.listItem ? Theme.listItem.minimumHeight : 24
                              text: "date install"
                              color: "white"
                          }

                          AppText
                          {
                              id: addressAppText
                              height: !Theme.listItem ? Theme.listItem.minimumHeight : 24
                              text: "address install"
                              color: "white"
                          }
                      }
                  }
              }
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
