import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import ToolsModel 1.0
Item {
    FontLoader {
        id: myFontLoader
        source: "/fonts/Inter-Medium.ttf"
    }
    FontLoader {
        id: myTextFontLoader
        source: "/fonts/Inter-Light.ttf"
    }
    FontLoader {
        id: myMediumTextFontLoader
        source: "/fonts/Inter-Regular.ttf"
    }
    FontLoader {
        id: myBoldTextFontLoader
        source: "/fonts/Inter-ExtraBold.ttf"
    }
    FontLoader {
        id: openSansFontLoader
        source: "/fonts/OpenSans-Medium.ttf"
    }
    property string mediumInterFont: myFontLoader.name
    property string lightInterFont: myTextFontLoader.name
    property string regularInterFont: myMediumTextFontLoader.name
    property string boldInterFont : myBoldTextFontLoader.name
    property string openSansFont: openSansFontLoader.name
    property string backgroundColor: "#141315"
    property string separatorColor: "#201F23"
    property string textColor: "#89898A"
    property string textfieldColor: "#1D1C1E"
    property string textfieldTextColor: "#F2F2F2"
    property string labelColor: "#888788"
    property int pageNumber: 1
    Rectangle {
        id: toolsDialog
        width: 672
        height: 560
        color: backgroundColor
        anchors.fill: parent
        radius: 12
        ColumnLayout {
            id: toolsMainLayout
            spacing: 10
            Rectangle {
                height: 10
            }
            //---------------------------------topLayout-----------------------------------//
             RowLayout {
               id: topToolsTopLayout
               width: toolsDialog.width
               anchors.topMargin: 30
               Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
               RowLayout{
                   Layout.leftMargin: 274
                   Text {
                        text: "Tools"
                        color: "white"
                        font.family: regularInterFont
                        font.pixelSize: 14
                   }
               }
               RowLayout {
                   Layout.leftMargin: 264
                   Button {
                       id: tools_exit
                       icon.name: "btn-exit"
                       icon.source: "/assets/ic_clear_24px.png"
                       icon.color: tools_exit.down ? "#D0D0D0" : "#4F4E50"
                       background: Rectangle {
                           width: tools_exit.contentItem.width // Set the width of the background to match the icon width
                           height: tools_exit.contentItem.height // Set the height of the background to match the icon height
                           color: "transparent" // Set the color to transparent to maintain only the icon size
                       }
                   }
               }
           }
            //---------------------------------------separator part--------------------------//
             RowLayout {
                 id: separatorLayout
                 Rectangle {
                     opacity: enabled ? 1 : 0.3
                     color: separatorColor
                     radius: 2
                     implicitWidth: toolsDialog.width
                     border.color: separatorColor // Set the color of the bottom border
                     Rectangle {
                         width: parent.width
                         height: 1
                         color: separatorColor// Set the color of the bottom border
                         anchors {
                             bottom: parent.bottom
                             left: parent.left
                         }
                         z: 1
                     }
                 }
             }
             //-----------------------------------Tabbar Layout---------------------------//
             RowLayout {
                 Layout.leftMargin: 20
                 TabBar {
                     id: toolsTabbar
                     width: topToolsTopLayout.width
                     spacing: 20
                     background: Rectangle {
                     color: backgroundColor
                     }
                     TabButton {
                         id: lookupButton
                         text: qsTr("GeoIP Lookup")
                         width: 102
                         font.pixelSize: 13
                         font.family: openSansFont
                         contentItem: Text {
                             text: lookupButton.text
                             font: lookupButton.font
                             opacity: enabled ? 1.0 : 0.3
                             color: lookupButton.checked ? "#158FD5" : "#4F4E50"
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                             elide: Text.ElideRight
                         }
                         background: Rectangle {
                             implicitHeight: 40
                             opacity: enabled ? 1 : 0.3
                             color: backgroundColor
                             radius: 2
                             Rectangle {
                                 width: lookupButton.width
                                 height: 2
                                 color: lookupButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                 anchors {
                                     bottom: parent.bottom
                                     left: parent.left
                                 }
                                 z: 1
                             }
                         }
                         onClicked: {
                             pageNumber = 1
                         }
                     }
                     TabButton {
                         id: psnButton
                         text: qsTr("PSN Resolver")
                         width: 97
                         font.pixelSize: 13
                         font.family: openSansFont
                         contentItem: Text {
                             text: psnButton.text
                             font: psnButton.font
                             opacity: enabled ? 1.0 : 0.3
                             color: psnButton.checked ? "#158FD5" : "#4F4E50"
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                             elide: Text.ElideRight
                         }

                         background: Rectangle {
                             implicitHeight: 40
                             opacity: enabled ? 1 : 0.3
                             color: backgroundColor
                             radius: 2
                             Rectangle {
                                 width: psnButton.width
                                 height: 2
                                 color: psnButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                 anchors {
                                     bottom: parent.bottom
                                     left: parent.left
                                 }
                                 z: 1
                             }
                         }
                         onClicked: {
                             pageNumber = 2
                         }
                     }
                     TabButton {
                         id: xboxButton
                         text: qsTr("XBOX Resolver")
                         width: 108
                         font.pixelSize: 13
                         font.family: openSansFont
                         contentItem: Text {
                             text: xboxButton.text
                             font: xboxButton.font
                             opacity: enabled ? 1.0 : 0.3
                             color: xboxButton.checked ? "#158FD5" : "#4F4E50"
                             horizontalAlignment: Text.AlignHCenter
                             verticalAlignment: Text.AlignVCenter
                             elide: Text.ElideRight
                         }
                         background: Rectangle {
                             implicitHeight: 40
                             opacity: enabled ? 1 : 0.3
                             color: backgroundColor
                             radius: 2
                             Rectangle {
                                 width: xboxButton.width
                                 height: 2
                                 color: xboxButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                 anchors {
                                     bottom: parent.bottom
                                     left: parent.left
                                 }
                                 z: 1
                             }
                         }
                         onClicked: {
                             pageNumber = 3
                         }
                     }
                 }
             }
             //-------------------------------------search Layout-----------------------//
             RowLayout {
                 Layout.topMargin: 16
                 Layout.leftMargin: 24
                 TextField {
                     id: toolsSearch
                     placeholderText: pageNumber === 1 ? qsTr("1.1.1.1") :
                                      pageNumber === 2 ? qsTr("PSN Username") :
                                      qsTr("Xbox Gamertag")
                     placeholderTextColor : "white"
                     font.family: regularInterFont
                     font.pixelSize: 14
                     color: "white"
                     background: Rectangle {
                         implicitWidth: 624
                         implicitHeight: 36
                         color: "#1D1C1E"
                         radius: 8
                     }
                     Image {
                         id: toolsSearchIcon
                         source: "assets/toolsSearch.png" // Set the path the icon image
                         sourceSize.width: 13 // Set the width of the icon
                         sourceSize.height: 13 // Set the height of the icon
                         anchors {
                             right: toolsSearch.right // Position the icon to the right of the TextField
                             rightMargin: 13 // Adjust the margin as needed
                             verticalCenter: toolsSearch.verticalCenter
                         }

                     }
                     ColorOverlay {
                         anchors.fill: toolsSearchIcon
                         source: toolsSearchIcon
                         color: "white"  // make image like it lays under red glass
                     }
                 }
             }
             //----------------------------------main Table Layout--------------------------------//
             RowLayout {
                 Layout.leftMargin: 24
                 TableView {
                     id: toolsTableView
                     ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active; rightPadding:  44}
                     Layout.fillWidth: true
                     height: 336
                     clip: true
                     model: ToolsModel {}
                     delegate: Rectangle {
                         implicitHeight: 56
                         color: backgroundColor
                         Text {
                             text: display
                             color: "white"
                             font.family: textFont
                             font.pixelSize: 14
                             anchors.left : parent.left
                             anchors.verticalCenter: parent.verticalCenter
                         }
                         Rectangle {
                           width: parent.width
                           height: 1
                           color: tableSeparatorColor
                           anchors {
                               bottom: parent.bottom
                               left: parent.left
                           }
                           z: 1
                        }
                     }
                     columnWidthProvider: function (column) {
                         if(column === 0) {
                             return 320
                         } else {
                             return 300
                         }

                     }
                 }
             }
        }
    }
}
