import VPlayApps 1.0
import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import "delegates"
import QtLocation 5.5
import QtPositioning 5.5
import Qt.labs.settings 1.0
import QtQuick.XmlListModel 2.0

Page {
    Rectangle
    {
        anchors.fill: parent
        color: "#2b2b2b"
    }

    AddOrderItem {
        id: addOrderItem
        visibleBackArrow: true
        visibleAddButton: false
        onBack: stackViewJobs.pop()
    }

    XmlListModel {
      id: stationsModel

      source: "http://dynamisch.citybikewien.at/citybike_xml.php"
      query: "/stations/station"

      XmlRole { name: "internalId"; query: "internal_id/number()" }
      XmlRole { name: "name"; query: "name/string()" }
      XmlRole { name: "description"; query: "description/string()" }

      XmlRole { name: "latitude"; query: "latitude/number()" }
      XmlRole { name: "longitude"; query: "longitude/number()" }

      XmlRole { name: "availability"; query: "status/string()" }
      XmlRole { name: "boxes"; query: "boxes/string()" }
      XmlRole { name: "freeBoxes"; query: "free_boxes/number()" }
      XmlRole { name: "freeBikes"; query: "free_bikes/number()" }

      onStatusChanged: {
        if (status === XmlListModel.Ready) {
          favsModel.update()
        }
      }
    }

    ListModel {
      id: favsModel

      function update() {
        clear()

        // Nearest from GPS coords
        updateNearest()

        // Add favs
        for (var i = 0; i < stationsModel.count; i++) {
          var station = stationsModel.get(i)
          if (settings.favorites.indexOf(station.internalId) !== -1) {
            append({
                     internalId: station.internalId,
                     name: station.name,
                     freeBoxes: station.freeBoxes,
                     freeBikes: station.freeBikes,
                     favorited: settings.favorites.indexOf(station.internalId) !== -1
                   })
          }
        }
      }

      function updateNearest() {
        if (!map.userPositionAvailable)
          return

        // Compare current user location with all other stations
        var currentDistance = -1
        var currentIndex = -1

        for (var i = 0; i < stationsModel.count; i++) {
          var station = stationsModel.get(i)

          var distance = map.userPosition.coordinate.distanceTo(QtPositioning.coordinate(station.latitude, station.longitude))
          if (currentDistance === -1 || distance < currentDistance) {
            currentDistance = distance
            currentIndex = i
          }
        }

        // Get station
        if (currentIndex !== -1) {
          var station = stationsModel.get(currentIndex)

          set(0, {
                internalId: station.internalId,
                name: station.name,
                freeBoxes: station.freeBoxes,
                freeBikes: station.freeBikes,
                favorited: settings.favorites.indexOf(station.internalId) !== -1
              })
        }
      }
    }


    AppMap {
      id: map

      anchors.top: addOrderItem.bottom
      anchors.left: parent.left
      anchors.right: parent.right
      anchors.bottom: parent.bottom

      showUserPosition: true

      plugin: Plugin {
        name: "mapbox"
        // configure your own map_id and access_token here
        parameters: [  PluginParameter {
            name: "mapbox.mapping.map_id"
            value: "mapbox.streets"
          },
          PluginParameter {
            name: "mapbox.access_token"
            value: "pk.eyJ1IjoiZ3R2cGxheSIsImEiOiJjaWZ0Y2pkM2cwMXZqdWVsenJhcGZ3ZDl5In0.6xMVtyc0CkYNYup76iMVNQ"
          },
          PluginParameter {
            name: "mapbox.mapping.highdpi_tiles"
            value: true
          }]
      }

      // Defaults to Vienna, AT
      center: QtPositioning.coordinate(48.208417, 16.372472)
      zoomLevel: 15
      Component.onCompleted: {
        map.center = QtPositioning.coordinate(48.208417, 16.372472)
        map.zoomLevel = 15
      }

      onMapClicked: {
        // Clicked on map, remove current selection
        page.selectedIndex = -1
      }

      onUserPositionChanged: {
        favsModel.updateNearest()
      }

      // Station markers
      MapItemView {
        model: stationsModel

        delegate: MapQuickItem {
          coordinate: QtPositioning.coordinate(latitude, longitude)

          anchorPoint.x: image.width * 0.5
          anchorPoint.y: image.height

          sourceItem: AppImage {
            id: image

            width: dp(40)
            height: dp(34)

            source: {
              // Inactive
              if (availability !== "aktiv") {
                return "../assets/pin-grey.png"
              }

              var freeItems = 2//page.displayFreeBikes ? freeBikes : freeBoxes

              if (freeItems === 0) {
                return "../assets/pin-red.png"
              }
              else if (freeItems <= 2) {
                return "../assets/pin-orange.png"
              }
              else {
                return "../assets/pin-green.png"
              }
            }

            MouseArea {
              anchors.fill: parent
              onClicked: {
                page.selectedIndex = index
              }
            }
          }
        }
      }
    }
}
