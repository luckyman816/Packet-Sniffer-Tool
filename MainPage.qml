import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import TableModel 1.0
Rectangle {
    width: 1440
    height: 810
    visible: true
    anchors.centerIn: parent
    FontLoader {
        id: myFontLoader
        source: "/fonts/Inter-Medium.ttf"
    }
    FontLoader {
        id: myTextFontLoader
        source: "/fonts/Inter-Regular.ttf"
    }
    property string backgroundColor: "#141315"
    property string tableSeparatorColor: "#201F23"
    property string comboboxColor: "#1D1C1E"
    property string comboboxTextColor: "#F2F2F2"
    property string labelColor: "#888788"
    property string separatorColor: "#201F23"
    property string tableTextColor : "#201F23"
    property string generalFont: myFontLoader.name
    property string textFont: myTextFontLoader.name
    property string tabButtonColorOn : "#158FD5"
    property string tabButtonColorOff : "#4F4E50"
    property string bottomTextColor : "#838384"
    property string paginationBackgroundColor: "#19181A"
    property string paginationBorderColor: "#201F23"
    property int itemsPerPage: 10
    property int currentPage: 1
    property int totalPages: Math.ceil(myModel.count / itemsPerPage)
    Rectangle {
           id: main_rectangle
           color: backgroundColor
           width: screen.width
           height: screen.height
    }
    ColumnLayout {
            id: columnLayout
            anchors.fill: parent // Fill the whole window with ColumnLayout
            width: screen.width
            height: screen.height
            spacing: 6
            ColumnLayout {
                spacing: 30
                RowLayout {
                    id: topRowLayout
                    spacing: 16
                    Layout.topMargin: 20
                    Layout.leftMargin: 40
                    Row {
                        spacing: 12
                        Image {
                            source: "assets/OctoSniff.png"
                            width: 169
                            height: 33
                        }
                        Rectangle {
                            width: 2
                            height: control.height
                            color: separatorColor
                        }
                        ComboBox {
                            id: control
                            model: ["Local Area Connection - 192.168.0.1/32", "Local Area Connection - 192.168.0.1/43", "Local Area Connection - 192.168.0.1/53"]
                            delegate: ItemDelegate {
                                id: itemText
                                width: control.width
                                contentItem: Text {
                                    text: modelData
                                    color: itemText.focus? "#F2F2F2" : labelColor
                                    font.pixelSize: 14
                                    font.family: textFont
                                    elide: Text.ElideRight
                                    verticalAlignment: Text.AlignVCenter

                                }
                                background: Rectangle {
                                    width: parent.width
                                    height: 1
                                    color: "#201F23"
                                    anchors {
                                        bottom: parent.bottom
                                    }
                                    z: 1
                                }
                                highlighted: control.highlightedIndex === index
                            }

                            indicator: Canvas {
                                id: canvas
                                x: control.width - width - control.rightPadding
                                y: control.topPadding + (control.availableHeight - height) / 2
                                width: 12
                                height: 8
                                contextType: "2d"

                                Connections {
                                    target: control
                                    onPressedChanged: canvas.requestPaint()
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
                                rightPadding: control.indicator.width + control.spacing
                                text: control.displayText
                                font.pixelSize: 14
                                font.family: textFont
                                color: comboboxTextColor
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignLeft
                            }

                            background: Rectangle {
                                implicitWidth: 330
                                implicitHeight: 36
                                color:  comboboxColor
                                radius: 8
                            }

                            popup: Popup {
                                y: control.height + 10
                                width: control.width
                                implicitHeight: contentItem.implicitHeight
                                topPadding: 1
                                contentItem: ListView {
                                    clip: true
                                    implicitHeight: contentHeight
                                    model: control.popup.visible ? control.delegateModel : null
                                    currentIndex: control.highlightedIndex
                                    ScrollIndicator.vertical: ScrollIndicator { }
                                }
                                background: Rectangle {
                                    color:  comboboxColor
                                    radius: 8
                                }
                            }
                        }
                    }
                    Row {
                        spacing: 8
                        Button {
                            id: sniff
                            contentItem: Text {
                                text: sniff.down ? "Stop Sniff" : "Start Sniff"
                                font.family: generalFont
                                font.bold: true
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color: sniff.down ? "white" : "#158FD5"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                            background: Rectangle {
                                implicitWidth: 96
                                implicitHeight: 36
                                color: sniff.down ? "#BF2500" : "#0C2330"
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                            onClicked: {
                                sniff.down = !sniff.down;
                            }
                        }
                        Button {
                            id: arp
                            text: qsTr("Setup ARP")

                            contentItem: Text {
                                text: arp.text
                                font.family: generalFont
                                font.bold: true
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color: arp.down ? "white" :"#BF2500"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            background: Rectangle {
                                implicitWidth: 96
                                implicitHeight: 36
                                color: arp.down ? "#BF2500" : "#2C0B0B"
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                            onClicked: {
                                arpActiveDialog.open()
                            }
                        }
                    }
                    Rectangle {
                        width: 2
                        height: info.icon.height // Set the height of the vertical separator to match the row height
                        color: separatorColor // Set the color of the vertical separator
                    }
                    Row {
                        Button {
                            id: info
                            icon.name: "btn-info"
                            icon.source: "/assets/info.png"
                            icon.color: info.down ? "#D0D0D0":"#4F4E50"
                            background: Rectangle {
                                width: info.icon.width // Set the width of the background to match the icon width
                                height: info.icon.height // Set the height of the background to match the icon height
                                color: "transparent" // Set the color to transparent to maintain only the icon size
                            }
                            onClicked: {
                                helpDialog.open()
                            }
                        }
                        Button {
                            id: cog
                            icon.name: "btn-cog"
                            icon.source: "/assets/setting.png"
                            icon.color: cog.down ? "#D0D0D0":"#4F4E50"
                            background: Rectangle {
                                width: cog.icon.width // Set the width of the background to match the icon width
                                height: cog.icon.height // Set the height of the background to match the icon height
                                color: "transparent" // Set the color to transparent to maintain only the icon size
                            }
                            onClicked: {
                                toolsDialog.open()
                            }
                        }
                        Button {
                            id: setting
                            icon.name: "btn-setting"
                            icon.source: "/assets/cog.png"
                            icon.color: setting.down ? "#D0D0D0":"#4F4E50"
                            background: Rectangle {
                                width: setting.icon.width // Set the width of the background to match the icon width
                                height: setting.icon.height // Set the height of the background to match the icon height
                                color: "transparent" // Set the color to transparent to maintain only the icon size
                            }
                            onClicked: {
                                settingDialog.open()
                            }
                        }


                    }
                    Row {
                        leftPadding: 327
                        spacing: 9
                        Button {
                            id: restore
                            icon.name: "btn-minimise"
                            icon.source: "/assets/restore.png"
                            icon.color: restore.down ? "#D0D0D0":"white"
                            background: Rectangle {
                                width: restore.contentItem.width // Set the width of the background to match the icon width
                                height: restore.contentItem.height // Set the height of the background to match the icon height
                                color: "transparent" // Set the color to transparent to maintain only the icon size
                            }
                        }
                        Button {
                            id: minimize
                            icon.name: "btn-restore"
                            icon.source: "/assets/minimize.png"
                            icon.color: minimize.down ? "#D0D0D0":"white"
                            background: Rectangle {
                                width: minimize.contentItem.width // Set the width of the background to match the icon width
                                height: minimize.contentItem.height // Set the height of the background to match the icon height
                                color: "transparent" // Set the color to transparent to maintain only the icon size
                            }
                        }
                        Button {
                            id: exit
                            icon.name: "btn-exit"
                            icon.source: "/assets/exit.png"
                            icon.color: exit.down ? "#D0D0D0":"white"
                            background: Rectangle {
                                width: exit.contentItem.width // Set the width of the background to match the icon width
                                height: exit.contentItem.height // Set the height of the background to match the icon height
                                color: "transparent" // Set the color to transparent to maintain only the icon size
                            }
                            onClicked: {
                                Qt.quit()
                            }
                        }
                    }
                }
                RowLayout {
                    id: separatorRowLayout
                    Rectangle {
                        implicitWidth: main_rectangle.width
                        implicitHeight: 1
                        opacity: enabled ? 1 : 0.3
                        radius: 2
                        Rectangle {
                            width: parent.width
                            height: 1
                            color: tableSeparatorColor// Set the color of the bottom border
                            anchors {
                                bottom: parent.bottom
                                left: parent.left
                            }
                            z: 1
                        }
                    }
                }
               //----------------------TabBar Button Layout-------------------------//
                RowLayout {
                    id: tabBarRowLayout
                    Layout.leftMargin: 40
                    spacing: 10
                    TextField {
                        id: search
                        placeholderText: qsTr("Search...")
                        font.family: textFont
                        font.pixelSize: 14
                        color: "white"
                        background: Rectangle {
                            implicitWidth: 330
                            implicitHeight: 36
                            color: "#1D1C1E"
                            radius: 10
                        }
                        Image {
                            id: searchIcon
                            source: "assets/search.png" // Set the path the icon image
                            sourceSize.width: 20 // Set the width of the icon
                            sourceSize.height: 20 // Set the height of the icon
                            anchors {
                                right: search.right // Position the icon to the right of the TextField
                                rightMargin: 13 // Adjust the margin as needed
                                verticalCenter: search.verticalCenter
                            }

                        }
                        ColorOverlay {
                            anchors.fill: searchIcon
                            source: searchIcon
                            color: labelColor  // make image like it lays under red glass
                        }
                    }
                    TabBar {
                        id: tabBar
                        leftPadding: 750
                        spacing: 20
                        background: Rectangle {
                        color: "#141315"
                        }
                        TabButton {
                            id: playButton
                            text: qsTr("PlayStation")
                            width: 112
                            contentItem: Text {
                                text: playButton.text
                                leftPadding: 22
                                font.pixelSize: 14
                                font.family: generalFont
                                opacity: enabled ? 1.0 : 0.3
                                color: playButton.checked ? tabButtonColorOn : tabButtonColorOff
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                            RowLayout {
                                spacing: 5
                                id: playButtonLayout
                                anchors.leftMargin: 6
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                Image {
                                    id: playStationIcon
                                    source: "/assets/playStation.png"
                                    sourceSize.width: 18 // Set the width of the image
                                    sourceSize.height: 15 // Set the height of the image
                                    opacity: enabled ? 1.0 : 0.3
                                }
                                ColorOverlay {
                                    anchors.fill: playStationIcon
                                    source: playStationIcon
                                    color: playButton.checked ? tabButtonColorOn : tabButtonColorOff
                                }
                            }
                            background: Rectangle {
                                opacity: enabled ? 1 : 0.3
                                color: backgroundColor
                                radius: 2
                                border.color: backgroundColor
                                Rectangle {
                                    width: playButton.width
                                    height: 2
                                    color: playButton.checked ? tabButtonColorOn : backgroundColor
                                    anchors {
                                        bottom: parent.bottom
                                        left: parent.left
                                    }
                                    z: 1
                                }
                            }
                        }
                        TabButton {
                            id: xBoxButton
                            text: qsTr("Xbox")
                            width: 66
                            contentItem: Text {
                                text: xBoxButton.text
                                font.pixelSize: 14
                                font.family: generalFont
                                opacity: enabled ? 1.0 : 0.3
                                color: xBoxButton.checked ? tabButtonColorOn : tabButtonColorOff
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                leftPadding: 20
                            }
                            RowLayout {
                                spacing: 5
                                id: xBoxButtonLayout
                                anchors.leftMargin: 4
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                Image {
                                    id: xBoxIcon
                                    source: "/assets/xBox.png"
                                    sourceSize.width: 14 // Set the width of the image
                                    sourceSize.height: 14 // Set the height of the image
                                    opacity: enabled ? 1.0 : 0.3
                                }
                                ColorOverlay {
                                    anchors.fill: xBoxIcon
                                    source: xBoxIcon
                                    color: xBoxButton.checked ? tabButtonColorOn : tabButtonColorOff
                                }
                            }
                            background: Rectangle {
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                color: backgroundColor
                                radius: 2
                                border.color: backgroundColor // Set the color of the bottom border
                                Rectangle {
                                    width: xBoxButton.width
                                    height: 2
                                    color: xBoxButton.checked ? tabButtonColorOn : backgroundColor// Set the color of the bottom border
                                    anchors {
                                        bottom: parent.bottom
                                        left: parent.left
                                    }
                                    z: 1
                                }
                            }
                        }
                        TabButton {
                            id: pcButton
                            text: qsTr("PC")
                            width: 54
                            contentItem: Text {
                                text: pcButton.text
                                font.pixelSize: 14
                                font.family: generalFont
                                opacity: enabled ? 1.0 : 0.3
                                color: pcButton.checked ? tabButtonColorOn : tabButtonColorOff
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 20
                                elide: Text.ElideRight
                            }
                            RowLayout {
                                spacing: 5
                                id: pcButtonLayout
                                anchors.leftMargin: 4
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                Image {
                                    id: pcIcon
                                    source: "/assets/pc.png"
                                    sourceSize.width: 14 // Set the width of the image
                                    sourceSize.height: 14 // Set the height of the image
                                    opacity: enabled ? 1.0 : 0.3
                                }
                                ColorOverlay {
                                    anchors.fill: pcIcon
                                    source: pcIcon
                                    color: pcButton.checked ? tabButtonColorOn : tabButtonColorOff
                                }
                            }
                            background: Rectangle {
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                color: backgroundColor
                                radius: 2
                                border.color: backgroundColor // Set the color of the bottom border
                                Rectangle {
                                    width: pcButton.width
                                    height: 2
                                    color: pcButton.checked ? tabButtonColorOn : backgroundColor// Set the color of the bottom border
                                    anchors {
                                        bottom: parent.bottom
                                        left: parent.left
                                    }
                                    z: 1
                                }
                            }
                        }
                    }
                }
                //---------------------TableView Layout-----------------------------//
                RowLayout {
                    id: tableViewRowLayout
                    Layout.leftMargin: 40
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    ColumnLayout {
                        id: tableViewColumnLayout
                        width: tableViewRowLayout.width
                        // Custom Header
                        RowLayout{
                            Layout.fillWidth: true
                            height: 40
                            spacing: 3
                            Repeater {
                                model: 6 // Number of columns excluding the icon column
                                Rectangle {
                                   /* width: 150*/ // or tableView.columnWidthProvider(index) if defined
                                    height: parent.height
                                    color: backgroundColor
                                    width: [
                                        258, // ip address
                                        183, // country
                                        183, // city
                                        183,  // port
                                        183, // region
                                        183  // isp
                                    ][index]
                                    Label {
                                        text: [
                                           "IP ADDRESS", // ip address
                                           "PORT", // country
                                           "COUNTRY", // city
                                           "REGION", // port
                                           "CITY", // region
                                           "ISP" // isp
                                       ][index]
                                        font.letterSpacing: 1.5
                                        font.pixelSize: 13
                                        color: "#6D6D6E"
                                        anchors.centerIn: parent
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
                            // Icon in the last header column
                            Rectangle {
                                id: header_icon_down
                                width: 128 // Match your column width
                                height: parent.height
                                color: backgroundColor
                                Image {
                                    id: arrow_down
                                    source: "assets/ic_keyboard_arrow_up_24px.png" // Your icon
                                    anchors.right: header_icon_down.right
                                    anchors.verticalCenter: header_icon_down.verticalCenter

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
                                ColorOverlay {
                                    anchors.fill: arrow_down
                                    source: arrow_down
                                    color: "white"
                                }
                            }
                            Rectangle {
                                width: 30 // Match your column width
                                height: parent.height
                                color: backgroundColor
                                Image {
                                    id: arrow_up
                                    source: "assets/ic_keyboard_arrow_down_24px.png" // Your icon
                                    anchors.centerIn: parent
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
                                ColorOverlay {
                                    anchors.fill: arrow_up
                                    source: arrow_up
                                    color: "white"
                                }
                            }
                        }
                        TableView {
                            id: mainTableView
                            columnSpacing: 3
                            Layout.fillWidth: true
                            height: 470
                            clip: true
                            model: TableModel {}
                            delegate: Rectangle {
                                implicitWidth: 150
                                implicitHeight: 50
                                color: backgroundColor
                                Text {
                                    text: display
                                    color: "white"
                                    font.family: textFont
                                    font.pixelSize: 14
                                    anchors.centerIn: parent
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
                              MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        var modalDialogComponent = Qt.createComponent("EditModal.qml");
                                        if (modalDialogComponent.status === Component.Ready) {
                                            var modalDialog = modalDialogComponent.createObject(mainTableView, {
                                               parent
                                            });
                                            modalDialog.open();
                                        } else {
                                            console.error("Error loading modal dialog:", modalDialogComponent.errorString());
                                        }
                                    }
                                }
                            }
                            columnWidthProvider: function (column) {
                                if(column === 0) {
                                    return 258
                                } else if(column === 1){
                                    return 183
                                }  else if(column === 2){
                                    return 183
                                }  else if(column === 3){
                                    return 183
                                }  else if(column === 4){
                                    return 183
                                }  else if(column === 5){
                                    return 183
                                } else {
                                    return 160
                                }

                            }
                        }
                    }
                }
                //--------------------Bottom Layout----------------------------//
                RowLayout {
                    id: textRowLayout
                    Layout.leftMargin: 40
                    Layout.bottomMargin: 40
                    spacing: 10
                    Text {
                        id: bottomText
                        font.pixelSize: 14
                        font.family: textFont
                        text: qsTr("Showing 1-10 of 30 packets")
                        color: "white"
                    }
                    Row {
                        leftPadding: 209
                        RowLayout {
                            spacing: 6
                            Text {
                                id: psnText
                                font.pixelSize: 12
                                font.family: textFont
                                text: qsTr("Your PSN:")
                                color: bottomTextColor
                            }
                            TextField {
                                id: nameSPN
                                placeholderText: qsTr("nickName")
                                placeholderTextColor: "white"
                                color: "white"
                                font.pixelSize: 12
                                font.family: textFont
                                leftPadding: 16
                                background: Rectangle {
                                    implicitWidth: 120
                                    implicitHeight: 40
                                    color: "#1D1C1E"
                                    radius: 8
                                }
                            }
                        }
                    }
                    Row {
                        RowLayout {
                            spacing: 6
                            Text {
                                id: targetText
                                font.pixelSize: 12
                                font.family: textFont
                                text: qsTr("Target PSN:")
                                color: bottomTextColor
                            }
                            TextField {
                                id: targetPSN
                                placeholderText: qsTr("fh^gh36a")
                                leftPadding: 16
                                font.pixelSize: 12
                                font.family: textFont
                                color: "white"
                                placeholderTextColor: "white"
                                background: Rectangle {
                                    implicitWidth: 120
                                    implicitHeight: 40
                                    color: "#1D1C1E"
                                    radius: 8
                                }
                            }

                        }
                    }
                    Row {
                        leftPadding: 20
                        Button {
                            id: decrypt
                            text: qsTr("Decrypt")
                            contentItem: Text {
                                text: decrypt.text
                                leftPadding: 20
                                font.family: generalFont
                                font.bold: true
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color:  "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                            RowLayout {
                                spacing: 5
                                id: iconLayout
                                anchors.leftMargin: 18
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                Image {
                                    id: bug
                                    source: "/assets/decrypt.png" // Path to your icon file
                                    width: 24
                                    height: 24
                                    opacity: enabled ? 1.0 : 0.3
                                }
                                ColorOverlay {
                                    anchors.fill: bug
                                    source: bug
                                    color: "white"  // make image like it lays under red glass
                                }
                            }

                            background: Rectangle {
                                implicitWidth: 111
                                implicitHeight: 32
                                color: decrypt.down ? "#145174" : "#158FD4"
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                        }
                    }
                    RowLayout {
                        ListView {
                           id: listView
//                           anchors.fill: parent
                           orientation: ListView.Horizontal
                           snapMode: ListView.SnapToItem
                           highlightRangeMode: ListView.StrictlyEnforceRange
                           model: 3
                           clip: true
                           delegate: Rectangle {
                               id: item
                               width: listView.width
                               height: listView.height
                               Text {
                                   anchors.centerIn: parent
                                   text: "page " + index
                               }
                               MouseArea {
                                   anchors.fill: parent
                                   onClicked: listView.currentIndex = index // Set currentIndex on click
                               }
                           }
                       }

                       Item {
                           anchors.leftMargin: 248
                           anchors.top: parent.top
                           anchors.bottom: parent.bottom
                           anchors.left: parent.left
                           anchors.right: parent.right
                           Row {
                               spacing: 8
                               Repeater {
                                   model: listView.model
                                   Rectangle {
                                       width: 36
                                       height: 36
                                       border.color: index == listView.currentIndex ? paginationBorderColor : backgroundColor
                                       color: index == listView.currentIndex ? paginationBackgroundColor : backgroundColor
                                       Text {
                                           color: index == listView.currentIndex ? "white" : bottomTextColor
                                           anchors.centerIn: parent
                                           text: index + 1
                                           font.family: generalFont
                                           font.pixelSize: 14
                                       }
                                       MouseArea {
                                           anchors.fill: parent
                                           onClicked: listView.currentIndex = index
                                       }
                                       radius: 8
                                   }
                               }
                               Button {
                                   id: nextButton
                                   contentItem: Image {
                                       source: "assets/nextIcon.png"
                                       anchors.top: nextButton.top // Align the top of the icon with the top of the button
                                       anchors.left: nextButton.left
                                       anchors.leftMargin: 14
                                       anchors.topMargin: 12
                                   }
                                   background: Rectangle {
                                       width: 36
                                       height: 36
                                       radius: 8
                                       color: nextButton.down ? paginationBackgroundColor : "transparent" // Set the color to transparent to maintain only the icon size
                                   }
                                   onClicked: {
                                       listView.currentIndex = listView.currentIndex + 1
                                       if(listView.currentIndex == 3){
                                            listView.currentIndex = 0;
                                       }
                                   }
                               }
                           }
                       }
                    }
                }
            }
     }
    Popup {
           id: settingDialog
           modal: true
           focus: true
           visible: false
           width: 894
           height: 687
           padding: 0
           bottomInset: 0
           leftInset: 0
           topInset: 0
           rightInset: 0
           x: (parent.width - width) / 2
           y: (parent.height - height) / 2
           background: Rectangle {
            radius: 12
            color: backgroundColor
           }
           Loader {
               id: settingDialogLoader
               source: "SettingDialog.qml"
               anchors.fill: parent
        }
    }
    Popup {
           id: arpActiveDialog
           modal: true
           focus: true
           visible: false
           width: 688
           height: 635
           padding: 0
           bottomInset: 0
           leftInset: 0
           topInset: 0
           rightInset: 0
           x: (parent.width - width) / 2
           y: (parent.height - height) / 2
           background: Rectangle {
            radius: 12
            color: backgroundColor
           }
           Loader {
               id: arpActiveDialogLoader
               source: "ArpActiveDialog.qml"
               anchors.fill: parent
        }
    }
    Popup {
           id: toolsDialog
           modal: true
           focus: true
           visible: false
           width: 672
           height: 560
           padding: 0
           bottomInset: 0
           leftInset: 0
           topInset: 0
           rightInset: 0
           x: (parent.width - width) / 2
           y: (parent.height - height) / 2
           background: Rectangle {
            radius: 12
            color: backgroundColor
           }
           Loader {
               id: toolsDialogLoader
               source: "ToolsDialog.qml"
               anchors.fill: parent
        }
    }
    Popup {
           id: helpDialog
           modal: true
           focus: true
           visible: false
           width: 940
           height: 636
           padding: 0
           bottomInset: 0
           leftInset: 0
           topInset: 0
           rightInset: 0
           x: (parent.width - width) / 2
           y: (parent.height - height) / 2
           background: Rectangle {
            radius: 12
            color: backgroundColor
           }
           Loader {
               id: helpDialogLoader
               source: "HelpDialog.qml"
               anchors.fill: parent
        }
    }
}

