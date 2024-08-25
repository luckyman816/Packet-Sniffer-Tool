import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
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
    property string paragraphColor : "#1D1C1E"
    Rectangle {
        id: helpDialog
        width: 940
        height: 636
        color: backgroundColor
        anchors.fill: parent
        radius: 12
            ColumnLayout {
                id: helpMainLayout
                width: parent.width
                spacing: 10
                //---------------------------------topLayout-----------------------------------//
                 RowLayout {
                   id: helpTopLayout
                   width: parent.width
                   Layout.topMargin: 30
                   RowLayout{
                       Layout.leftMargin: 455
                       Text {
                            text: "Help"
                            color: "white"
                            font.family: regularInterFont
                            font.pixelSize: 14
                       }
                   }
                   RowLayout {
                       Layout.leftMargin: 390
                       Button {
                           id: help_exit
                           icon.name: "btn-exit"
                           icon.source: "/assets/ic_clear_24px.png"
                           icon.color: help_exit.down ? "#D0D0D0" : "#4F4E50"
                           background: Rectangle {
                               width: help_exit.contentItem.width // Set the width of the background to match the icon width
                               height: help_exit.contentItem.height // Set the height of the background to match the icon height
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
                          implicitWidth: helpDialog.width
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
                  //-----------------------------------Main Part------------------------------//
                  RowLayout {
                    ColumnLayout {
                        spacing: 16
                        Layout.leftMargin: 40
                        Layout.topMargin: 26
                        Layout.alignment: Qt.AlignTop
                        RowLayout{
                            Text {
                                 text: "FAQ"
                                 color: "white"
                                 font.family: boldInterFont
                                 font.bold: true
                                 font.pixelSize: 32
                            }
                        }
                        RowLayout {
                            Text {
                                 text: "Everything you need to know about product"
                                 color: textColor
                                 font.family: regularInterFont
                                 font.pixelSize: 13
                            }
                        }
                        RowLayout {
                            Rectangle {
                                id: infoRect
                                width: 400
                                height: 72
                                radius: 12
                                color: paragraphColor
                                anchors.leftMargin: 12
                                anchors.rightMargin: 12
                                RowLayout {
                                    anchors.centerIn: parent
                                    Image {
                                        source: "assets/infoIcon.png"
                                        sourceSize.width: 40
                                        sourceSize.height: 40
                                    }
                                    ColumnLayout {
                                        Layout.leftMargin: 14
                                        Text {
                                            text: qsTr("Need more support?")
                                            font.pixelSize: 13
                                            font.family: boldInterFont
                                            color: "white"
                                        }
                                        Text {
                                            text: '<html><style type="text/css">a:link {color:white;}a:active {color:yellow;}</style><body>Please, <a href=\"http://qt-project.org\">visit our website</a> to get <a href="Live Chat Support">Live Chat Support</a></body></html>'
                                            onLinkActivated: console.log(link + " link activated")
                                            textFormat: Text.RichText
                                            font.pixelSize: 13
                                            font.family: regularInterFont
                                            color: textColor
                                        }
                                    }
                                }
                            }
                        }
                    }
                    ColumnLayout {
                        Layout.leftMargin: 20
                        Layout.topMargin: 26
                        spacing: 5
                          Accordion {
                              Text {
                                  text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed lorem leo. Vestibulum quis neque non justo hendrerit vestibulum vitae vel ligula. Sed ac mi at neque facilisis luctus. Fusce ultricies risus augue, vel pharetra est bibendum nec. Donec vulputate odio leo, eget fermentum sem tempus eu.")
                                  color: textColor
                                   font.family: regularInterFont
                                   font.pixelSize: 11
                                   wrapMode: Text.Wrap
                                   lineHeight: 1
                                  width: 433
                                   height: 64
                              }
                          }
                          Accordion {
                              Text {
                                  text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed lorem leo. Vestibulum quis neque non justo hendrerit vestibulum vitae vel ligula. Sed ac mi at neque facilisis luctus. Fusce ultricies risus augue, vel pharetra est bibendum nec. Donec vulputate odio leo, eget fermentum sem tempus eu.")
                                  color: textColor
                                   font.family: regularInterFont
                                   font.pixelSize: 11
                                   wrapMode: Text.Wrap
                                  width: 433
                                   height: 64
                                   lineHeight: 1
                              }
                          }
                          Accordion {
                              Text {
                                  text: qsTr("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed lorem leo. Vestibulum quis neque non justo hendrerit vestibulum vitae vel ligula. Sed ac mi at neque facilisis luctus. Fusce ultricies risus augue, vel pharetra est bibendum nec. Donec vulputate odio leo, eget fermentum sem tempus eu.")
                                  color: textColor
                                   font.family: regularInterFont
                                   font.pixelSize: 11
                                   wrapMode: Text.Wrap
                                  width: 433
                                   height: 64
                                   lineHeight: 1
                              }
                        }
                 }
            }
        }

    }
}
