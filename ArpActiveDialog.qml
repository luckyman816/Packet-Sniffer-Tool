import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import ArpDatabase 0.1
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
    property string tableSeparatorColor: "#201F23"
    property string textColor: "#89898A"
    property string comboboxColor: "#1D1C1E"
    property string comboboxTextColor: "#F2F2F2"
    property string checkboxindicator: "#158FD4"
    property int progressIndex : 1
    Rectangle {
        id: arpActiveDialog
        width: 688
        height: 635
        color: backgroundColor
        anchors.fill: parent
        radius: 12
        ColumnLayout {
            id: arpMainLayout
            width: arpActiveDialog.width
            spacing: 10
            Rectangle {
                height: 10
            }
             RowLayout {
                id: topArpLayout
                width: arpActiveDialog.width
                anchors.topMargin: 30
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                RowLayout{
                    Text {
                         Layout.leftMargin: 240
                         text: "ARP Active"
                         color: "white"
                         font.family: regularInterFont
                         font.pixelSize: 14
                    }
                }
                RowLayout {
                    Button {
                        id: arp_exit
                        icon.name: "btn-exit"
                        icon.source: "/assets/ic_clear_24px.png"
                        icon.color: arp_exit.down ? "#D0D0D0" : "#4F4E50"
                        background: Rectangle {
                            width: arp_exit.contentItem.width // Set the width of the background to match the icon width
                            height: arp_exit.contentItem.height // Set the height of the background to match the icon height
                            color: "transparent" // Set the color to transparent to maintain only the icon size
                        }
                        Layout.leftMargin: 200
                    }
                }
            }
            //---------------------------------------separator part--------------------------//
             RowLayout {
                 id: separatorRowLayout
                 Rectangle {
                     implicitWidth: arpActiveDialog.width
                     implicitHeight: arpActiveDialog
                     opacity: enabled ? 1 : 0.3
                     color: "#201F23"
                     radius: 2
                     border.color: "#201F23" // Set the color of the bottom border
                     Rectangle {
                         width: parent.width
                         height: 1
                         color: "#201F23"// Set the color of the bottom border
                         anchors {
                             bottom: parent.bottom
                             left: parent.left
                         }
                         z: 1
                     }
                 }
             }
             //-----------------------------------flow part------------------------------------//
             RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Button {
                    id: flow_1
                    text: qsTr("1")
                    contentItem: Text {
                        text: flow_1.text
                        font.pixelSize: 15
                        font.family: boldInterFont
                        font.bold: true
                        opacity: enabled ? 1.0 : 0.3
                        color: progressIndex == 1 ? backgroundColor : textColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       border.color: textColor
                       border.width: 1
                       color: progressIndex == 1 ? textColor : backgroundColor
                       radius: size / 2
                       readonly property real size: Math.min(control.width, control.height)
                       width: 28
                       height: 28
                       anchors.centerIn: parent

                    }
                }
                Text {
                    id: flowText_1
                    text: qsTr("Network Interface")
                    font.pixelSize: 13
                    font.family: mediumInterFont
                    color: progressIndex == 1 ? "white" : textColor
                }
                Rectangle {
                    height: 1
                    color: textColor
                    width: 23
                }
                Button {
                    id: flow_2
                    text: qsTr("2")
                    contentItem: Text {
                        text: flow_2.text
                        font.pixelSize: 15
                        font.family: boldInterFont
                        font.bold: true
                        opacity: enabled ? 1.0 : 0.3
                        color: progressIndex == 2 ? backgroundColor : textColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       border.color: textColor
                       border.width: 1
                       color: progressIndex == 2 ? textColor : backgroundColor
                       radius: size / 2
                       readonly property real size: Math.min(control.width, control.height)
                       width: 28
                       height: 28
                       anchors.centerIn: parent

                    }
                }
                Text {
                    id: flowText_2
                    text: qsTr("Router IPv4")
                    font.pixelSize: 13
                    font.family: mediumInterFont
                    color:  progressIndex == 2 ? "white" : textColor
                }
                Rectangle {
                    height: 1
                    color: textColor
                    width: 23
                }
                Button {
                    id: flow_3
                    text: qsTr("3")
                    contentItem: Text {
                        text: flow_3.text
                        font.pixelSize: 15
                        font.family: boldInterFont
                        font.bold: true
                        opacity: enabled ? 1.0 : 0.3
                        color: progressIndex == 3 ? backgroundColor : textColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }
                    background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       border.color: textColor
                       border.width: 1
                       color:  progressIndex == 3 ? textColor : backgroundColor
                       radius: size / 2
                       readonly property real size: Math.min(control.width, control.height)
                       width: 28
                       height: 28
                       anchors.centerIn: parent

                    }
                }
                Text {
                    id: flowText_3
                    text: qsTr("Database")
                    font.pixelSize: 13
                    font.family: mediumInterFont
                    color: progressIndex == 3 ? "white" : textColor
                }
             }
             ColumnLayout {
                 spacing: 12
                 Layout.leftMargin: 30
                 Layout.topMargin: 16
                 visible: progressIndex == 1 ? true : false
                 Text {
                      text: "Select Network Interface"
                      color: textColor
                      font.pixelSize: 12
                      font.family: regularInterFont
                  }
                 ComboBox {
                          id: networkInterface_combobox
                          model: ["Local Area Connection - 192.168.0.1/32", "Local Area Connection - 192.168.0.1/43", "Local Area Connection - 192.168.0.1/53"]
                          delegate: ItemDelegate {
                              id: itemText_Network
                              contentItem: Text {
                                  text: modelData
                                  font.family: regularInterFont
                                  font.pixelSize: 14
                                  color: itemText_Network.focus ? "#F2F2F2" : labelColor
                                  elide: Text.ElideRight
                                  verticalAlignment: Text.AlignVCenter
                              }
                              background: Rectangle {
                                  height: 1
                                  color: "#201F23"
                                  anchors {
                                      bottom: parent.bottom
                                  }
                                  z: 1
                              }
                              highlighted: networkInterface_combobox.highlightedIndex === index
                          }

                          indicator: Canvas {
                              id: canvas_interface
                              x: networkInterface_combobox.width - width - networkInterface_combobox.rightPadding
                              y: networkInterface_combobox.topPadding + (networkInterface_combobox.availableHeight - height) / 2
                              width: 12
                              height: 8
                              contextType: "2d"

                              Connections {
                                  target: networkInterface_combobox
                                  onPressedChanged: canvas_interface.requestPaint()
                              }

                              onPaint: {
                                  context.reset();
                                  context.moveTo(0, 0);
                                  context.lineTo(2, 0);
                                  context.lineTo(width / 2, height - 2);
                                  context.lineTo(width - 2, 0);
                                  context.lineTo(width, 0);
                                  context.lineTo(width / 2, height);
                                  context.closePath();
                                  context.fillStyle = "#8E8D8E";
                                  context.fill();
                              }
                          }

                          contentItem: Text {
                              leftPadding: 12
                              rightPadding: networkInterface_combobox.indicator.width + networkInterface_combobox.spacing
                              text: networkInterface_combobox.displayText
                              font.pixelSize: 14
                              font.family: regularInterFont
                              color: comboboxTextColor
                              verticalAlignment: Text.AlignVCenter
                              elide: Text.ElideRight
                              horizontalAlignment: Text.AlignLeft
                          }

                          background: Rectangle {
                              implicitWidth: arpActiveDialog.width - 60
                              implicitHeight: 44
                              color:  comboboxColor
                              radius: 8
                          }

                          popup: Popup {
                              y: networkInterface_combobox.height + 10
                              width: networkInterface_combobox.width
                              implicitHeight: contentItem.implicitHeight
                              topPadding:  1
                              contentItem: ListView {
                                  clip: true
                                  implicitHeight: contentHeight
                                  model: networkInterface_combobox.popup.visible ? networkInterface_combobox.delegateModel : null
                                  currentIndex: networkInterface_combobox.highlightedIndex
                                  ScrollIndicator.vertical: ScrollIndicator { }
                              }
                              background: Rectangle {
                                  color:  comboboxColor
                                  radius: 8
                              }
                          }
                      }
             }
             ColumnLayout {
                 spacing: 12
                 Layout.leftMargin: 30
                 Layout.topMargin: 16
                 visible: progressIndex == 2 ? true : false
                 Text {
                      text: "Select Router IPv4"
                      color: textColor
                      font.pixelSize: 12
                      font.family: regularInterFont
                  }
                 ComboBox {
                      id: routerIpv4_combobox
                      model: ["Local Area Connection - 192.168.0.1/32", "Local Area Connection - 192.168.0.1/43", "Local Area Connection - 192.168.0.1/53"]
                      delegate: ItemDelegate {
                          id: itemText_Router
                          contentItem: Text {
                              text: modelData
                              font.family: regularInterFont
                              font.pixelSize: 14
                              color: itemText_Router.focus ? "#F2F2F2" : labelColor
                              elide: Text.ElideRight
                              verticalAlignment: Text.AlignVCenter
                          }
                          background: Rectangle {
                              height: 1
                              color: "#201F23"
                              anchors {
                                  bottom: parent.bottom
                              }
                              z: 1
                          }
                          highlighted: routerIpv4_combobox.highlightedIndex === index
                      }

                      indicator: Canvas {
                          id: canvas_router
                          x: routerIpv4_combobox.width - width - routerIpv4_combobox.rightPadding
                          y: routerIpv4_combobox.topPadding + (routerIpv4_combobox.availableHeight - height) / 2
                          width: 12
                          height: 8
                          contextType: "2d"

                          Connections {
                              target: routerIpv4_combobox
                              onPressedChanged: canvas_router.requestPaint()
                          }

                          onPaint: {
                              context.reset();
                              context.moveTo(0, 0);
                              context.lineTo(2, 0);
                              context.lineTo(width / 2, height - 2);
                              context.lineTo(width - 2, 0);
                              context.lineTo(width, 0);
                              context.lineTo(width / 2, height);
                              context.closePath();
                              context.fillStyle = "#8E8D8E";
                              context.fill();
                          }
                      }

                      contentItem: Text {
                          leftPadding: 12
                          rightPadding: routerIpv4_combobox.indicator.width + routerIpv4_combobox.spacing
                          text: routerIpv4_combobox.displayText
                          font.pixelSize: 14
                          font.family: regularInterFont
                          color: comboboxTextColor
                          verticalAlignment: Text.AlignVCenter
                          elide: Text.ElideRight
                          horizontalAlignment: Text.AlignLeft
                      }

                      background: Rectangle {
                          implicitWidth: arpActiveDialog.width - 60
                          implicitHeight: 44
                          color:  comboboxColor
                          radius: 8
                      }

                      popup: Popup {
                          y: routerIpv4_combobox.height + 10
                          width: routerIpv4_combobox.width
                          implicitHeight: contentItem.implicitHeight
                          topPadding:  1
                          contentItem: ListView {
                              clip: true
                              implicitHeight: contentHeight
                              model: routerIpv4_combobox.popup.visible ? routerIpv4_combobox.delegateModel : null
                              currentIndex: routerIpv4_combobox.highlightedIndex
                              ScrollIndicator.vertical: ScrollIndicator { }
                          }
                          background: Rectangle {
                              color:  comboboxColor
                              radius: 8
                          }
                      }
                  }
            }
             ColumnLayout {
                Layout.topMargin: 16
                visible: progressIndex == 3 ? true : false
                ColumnLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Text {
                         text: "Please, select the network device. You can choose multiple."
                         color: textColor
                         font.pixelSize: 12
                         font.family: regularInterFont
                    }
                }
                ColumnLayout {
                    Layout.leftMargin: 24
                    Layout.topMargin: 10
                    visible: progressIndex == 3 ? true : false
                    RowLayout {
                        id: arpDatabaseRowLayout
                        Layout.fillWidth: true
                        height: 40
                        spacing: 0
                        Repeater {
                            model: 3
                            Rectangle {
                                height: parent.height
                                color: backgroundColor
                                width: [
                                    304,
                                    154,
                                    182
                                ][index]
                                Label {
                                    text: [
                                       "IPV4",
                                       "MAC",
                                       "VENDOR"
                                   ][index]
                                    font.letterSpacing: 1.5
                                    font.pixelSize: 13
                                    color: "#6D6D6E"
                                    anchors.left: parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.leftMargin: if(index == 0) return 64
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
                        }
                    }
                    TableView {
                        id: arpTableView
                        ScrollBar.vertical: ScrollBar { id: vbar; active: hbar.active; rightPadding:  24}
                        Layout.fillWidth: true
                        height: 336
                        clip: true
                        model: ArpDatabase {}
                        delegate: Rectangle {
                            implicitWidth: 150
                            implicitHeight: 50
                            color: backgroundColor
                            CheckBox {
                                id: arpCheckBox
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                visible: column === 0 ? true : false
                                indicator: Rectangle {
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    x: arpCheckBox.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 6
                                    color: backgroundColor
                                    border.color: textColor

                                    Rectangle {
                                        width: 20
                                        height: 20
                                        x: 0
                                        y: 0
                                        radius: 6
                                        color: checkboxindicator
                                        visible: arpCheckBox.checked
                                        Image {
                                            anchors.centerIn: parent
                                            source: "assets/ic_done_24px.png"
                                            sourceSize.width: 15
                                            sourceSize.height: 15
                                        }
                                    }
                                }
                            }
                            Text {
                                text: display
                                color: "white"
                                font.family: textFont
                                font.pixelSize: 14
                                anchors.left : parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: if(column === 0) return 68
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
                                return 304
                            } else if(column === 1){
                                return 154
                            } else {
                                return 182
                            }

                        }
                    }
                    RowLayout {
                        Layout.topMargin: 16
                        spacing: 206
                        Button {
                            id: inputHostButton
                            text: qsTr("Input Host Manually (IPv4 IP)")
                            contentItem: Text {
                                text: inputHostButton.text
                                font.family: mediumInterFont
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color:  "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                implicitWidth: 261
                                implicitHeight: 40
                                color: comboboxColor
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                            onClicked: {

                            }
                        }
                        Button {
                            id: saveArpButton
                            text: qsTr("Save ARP Settings")
                            contentItem: Text {
                                text: saveArpButton.text
                                font.family: mediumInterFont
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color:  "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                implicitWidth: 173
                                implicitHeight: 41
                                color: saveArpButton.down ? "#145174" : "#158FD4"
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                            onClicked: {

                            }
                        }
                    }
                }
             }
             Rectangle {
                visible: progressIndex == 1 || progressIndex == 2 ? true : false
                height: 350
             }
             RowLayout {
                 Layout.rightMargin: 30
                 Button {
                     id: next
                     text: qsTr("Next")
                     visible: progressIndex == 1 | progressIndex == 2 ? true : false
                     contentItem: Text {
                         text: next.text
                         font.family: mediumInterFont
                         font.pixelSize: 14
                         opacity: enabled ? 1.0 : 0.3
                         color:  "white"
                         horizontalAlignment: Text.AlignHCenter
                         verticalAlignment: Text.AlignVCenter
                         elide: Text.ElideRight
                     }

                     background: Rectangle {
                         implicitWidth: 80
                         implicitHeight: 40
                         color: next.down ? "#145174" : "#158FD4"
                         opacity: enabled ? 1 : 0.3
                         radius: 8
                     }
                     onClicked: {
                        progressIndex ++
                         if(progressIndex > 3){
                            progressIndex = 1 ;
                         }
                     }
                 }
                 Layout.alignment: Qt.AlignBottom | Qt.AlignRight
             }
        }
    }
}
