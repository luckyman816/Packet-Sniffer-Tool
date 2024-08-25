import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
import GameModel 1.0
import LabelsModel 1.0
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
        id: openSansFontLoader
        source: "/fonts/OpenSans-Medium.ttf"
    }
    property string mediumInterFont: myFontLoader.name
    property string lightInterFont: myTextFontLoader.name
    property string regularInterFont: myMediumTextFontLoader.name
    property string openSansFont: openSansFontLoader.name
    property string backgroundColor: "#141315"
    property string textColor: "#89898A"
    property string comboboxColor: "#1D1C1E"
    property string textfieldColor: "#1D1C1E"
    property string labelColor: "#888788"
    property string tableSeparatorColor: "#201F23"
    property string gameTableCellColor: "#262627"
    property int pageNumber: 1
    property bool showIndexPacket : false
    property bool showIndexTab: false
    property var textList: []
    property string newText: ""
    Rectangle {
        id: settingDialog
        width: 894
        height: 687
        anchors.fill: parent
        color: backgroundColor
        radius: 12
        ColumnLayout {
            id: generalMainLayout
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 8
            RowLayout {
                id: topSettingLayout
                Layout.leftMargin: 20
                Layout.topMargin: 10
                Layout.bottomMargin: 10
                spacing: 760
               Text {
                    text: "Settings"
                    color: "white"
                    font.family: lightInterFont
                    font.bold: true
                    font.pixelSize: 14
                    font.letterSpacing: 0.5
                    Layout.alignment: Qt.AlignLeft
                }
                Button {
                    id: exit
                    icon.name: "btn-exit"
                    icon.source: "/assets/ic_clear_24px.png"
                    icon.color: exit.down ? "#D0D0D0":"#4F4E50"
                    background: Rectangle {
                        width: exit.contentItem.width // Set the width of the background to match the icon width
                        height: exit.contentItem.height // Set the height of the background to match the icon height
                        color: "transparent" // Set the color to transparent to maintain only the icon size
                    }
                    Layout.alignment: Qt.AlignRight
                }
            }
           //---------------------------------------separator part--------------------------//
            RowLayout {
                id: separatorRowLayout
                Rectangle {
                    implicitWidth: settingDialog.width
                    implicitHeight: 1
                    opacity: enabled ? 1 : 0.3
                    color: "#201F23"
                    radius: 2
                    border.color: "#201F23" // Set the color of the bottom border
                    Rectangle {
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
            //--------------------------------------Tabbar Button part---------------------------------//
            RowLayout {
                Layout.leftMargin: 20
                TabBar {
                    id: tabBar
                    width: topSettingLayout.width
                    spacing: 20
                    background: Rectangle {
                    color: backgroundColor
                    }

                    TabButton {
                        id: generalButton
                        text: qsTr("General")
                        width: 62
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: generalButton.text
                            font: generalButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: generalButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: generalButton.width
                                height: 2
                                color: generalButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
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
                        id: interfaceButton
                        text: qsTr("Interface")
                        width: 70
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: interfaceButton.text
                            font: interfaceButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: interfaceButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: interfaceButton.width
                                height: 2
                                color: interfaceButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
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
                        id: gameButton
                        text: qsTr("Game Filters")
                        width: 94
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: gameButton.text
                            font: gameButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: gameButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: gameButton.width
                                height: 2
                                color: gameButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
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
                    TabButton {
                        id: packetButton
                        text: qsTr("Packet Filtering")
                        width: 113
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: packetButton.text
                            font: packetButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: packetButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: packetButton.width
                                height: 2
                                color: packetButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                anchors {
                                    bottom: parent.bottom
                                    left: parent.left                                }
                                z: 1
                            }
                        }
                        onClicked: {
                            pageNumber = 4
                        }
                    }
                    TabButton {
                        id: tabButton
                        text: qsTr("Tab Filtering")
                        width: 92
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: tabButton.text
                            font: tabButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: tabButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: tabButton.width
                                height: 2
                                color: tabButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                anchors {
                                    bottom: parent.bottom
                                    left: parent.left
                                }
                                z: 1
                            }
                        }
                        onClicked: {
                            pageNumber = 5
                        }
                    }
                    TabButton {
                        id: savedButton
                        text: qsTr("Saved Labels")
                        width: 95
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: savedButton.text
                            font: savedButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: savedButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: savedButton.width
                                height: 2
                                color: savedButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                anchors {
                                    bottom: parent.bottom
                                }
                                z: 1
                            }
                        }
                        onClicked: {
                            pageNumber = 6
                        }
                    }
                    TabButton {
                        id: keyboardButton
                        text: qsTr("Keyboard Shortcuts")
                        width: 142
                        font.pixelSize: 13
                        font.family: openSansFont
                        contentItem: Text {
                            text: keyboardButton.text
                            font: keyboardButton.font
                            opacity: enabled ? 1.0 : 0.3
                            color: keyboardButton.checked ? "#158FD5" : "#4F4E50"
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
                                width: keyboardButton.width
                                height: 2
                                color: keyboardButton.checked ? "#158FD5" : backgroundColor// Set the color of the bottom border
                                anchors {
                                    bottom: parent.bottom
                                }
                                z: 1
                            }
                        }
                        onClicked: {
                            pageNumber = 7
                        }
                    }
                }
            }
            //-----------------------------------General---------------------------------------------------//
            ColumnLayout {
                Layout.leftMargin: 24
                Layout.topMargin: 16
                visible: pageNumber == 1 ? true : false
                ColumnLayout {
                    spacing: 10
                    Text {
                         bottomPadding:  10
                         text: "GENERAL"
                         color: textColor
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         font.family: regularInterFont
                         Layout.alignment: Qt.AlignLeft
                     }
                    ColumnLayout {
                        spacing: 10
                        Layout.leftMargin: 8
                        CheckBox {
                            id: generalChechBox_1
                            text: qsTr("Remember last selected interface")
                            height: 40
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: generalChechBox_1.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: generalChechBox_1.checked
                                }
                            }

                            contentItem: Text {
                                text: generalChechBox_1.text
                                font.family: regularInterFont
                                font.pixelSize: 13
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: generalChechBox_1.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: generalCheckBox_2
                            text: qsTr("Remember last selected targets")
                            height: 40
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: generalCheckBox_2.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: generalCheckBox_2.checked
                                }
                            }

                            contentItem: Text {
                                text: generalCheckBox_2.text
                                font.family: regularInterFont
                                font.pixelSize: 13
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: generalCheckBox_2.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: generalCheckBox_3
                            text: qsTr("Use Discord rich presence")
                            height: 40
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: generalCheckBox_3.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: generalCheckBox_3.checked
                                }
                            }

                            contentItem: Text {
                                text: generalCheckBox_3.text
                                font.family: regularInterFont
                                font.pixelSize: 13
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: generalCheckBox_3.indicator.width + 16
                            }
                        }
                        }
                    }
                ColumnLayout {
                    Layout.topMargin: 24
                    spacing: 20
                    Text {
                         text: "SELECTED INTERFACE"
                         color: textColor
                         font.family: regularInterFont
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         Layout.alignment: Qt.AlignLeft
                     }
                    ComboBox {
                        id: generalInterface_combobox
                        model: ["Local Area Connection - 192.168.0.1/32", "Local Area Connection - 192.168.0.1/43", "Local Area Connection - 192.168.0.1/53"]
                        delegate: ItemDelegate {
                            id: itemText_Interface
                            contentItem: Text {
                                text: modelData
                                color: itemText_Interface.focus ? "white" : labelColor
                                font.pixelSize: 14
                                font.family: regularInterFont
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
                            highlighted: generalInterface_combobox.highlightedIndex === index
                        }

                        indicator: Canvas {
                            id: canvas_interface
                            x: generalInterface_combobox.width - width - 25
                            y: generalInterface_combobox.topPadding + (generalInterface_combobox.availableHeight - height) / 2
                            width: 12
                            height: 8
                            contextType: "2d"

                            Connections {
                                target: generalInterface_combobox
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
                            leftPadding: 24
                            rightPadding: generalInterface_combobox.indicator.width + generalInterface_combobox.spacing
                            text: generalInterface_combobox.displayText
                            font.pixelSize: 14
                            font.family: regularInterFont
                            color: "white"
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            horizontalAlignment: Text.AlignLeft
                        }

                        background: Rectangle {
                            implicitWidth: 480
                            implicitHeight: 44
                            color:  comboboxColor
                            radius: 10
                        }

                        popup: Popup {
                            y: generalInterface_combobox.height + 10
                            width: generalInterface_combobox.width
                            implicitHeight: contentItem.implicitHeight
                            topPadding:  1
                            contentItem: ListView {
                                clip: true
                                implicitHeight: contentHeight
                                model: generalInterface_combobox.popup.visible ? generalInterface_combobox.delegateModel : null
                                currentIndex: generalInterface_combobox.highlightedIndex
                                ScrollIndicator.vertical: ScrollIndicator { }
                            }
                            background: Rectangle {
                                color:  comboboxColor
                                radius: 10
                            }
                        }
                    }
                }
                ColumnLayout {
                    spacing: 20
                    Layout.topMargin: 14
                    Text {
                         text: "LANGUAGE"
                         color: textColor
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         font.family: regularInterFont
                         Layout.alignment: Qt.AlignLeft
                     }
                    ComboBox {
                        id: generalLanguage_combobox
                        model: ["English (United States)", "French", "Finnish"]
                        delegate: ItemDelegate {
                            id: itemText_language
                            contentItem: Text {
                                text: modelData
                                color: itemText_language.focus ? "white" : labelColor
                                font.family: regularInterFont
                                font.pixelSize: 14
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
                            highlighted: generalLanguage_combobox.highlightedIndex === index
                        }

                        indicator: Canvas {
                            id: canvas_language
                            x: generalLanguage_combobox.width - width - 25
                            y: generalLanguage_combobox.topPadding + (generalLanguage_combobox.availableHeight - height) / 2
                            width: 12
                            height: 8
                            contextType: "2d"

                            Connections {
                                target: generalLanguage_combobox
                                onPressedChanged: canvas_language.requestPaint()
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
                            leftPadding: 24
                            rightPadding: generalLanguage_combobox.indicator.width + generalLanguage_combobox.spacing
                            text: generalLanguage_combobox.displayText
                            font.family: regularInterFont
                            font.pixelSize: 14
                            color: "white"
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            horizontalAlignment: Text.AlignLeft
                        }

                        background: Rectangle {
                            implicitWidth: 480
                            implicitHeight: 44
                            color:  comboboxColor
                            radius: 10
                        }

                        popup: Popup {
                            y: generalLanguage_combobox.height + 10
                            width: generalLanguage_combobox.width
                            implicitHeight: contentItem.implicitHeight
                            topPadding:  1
                            contentItem: ListView {
                                clip: true
                                implicitHeight: contentHeight
                                model: generalLanguage_combobox.popup.visible ? generalLanguage_combobox.delegateModel : null
                                currentIndex: generalLanguage_combobox.highlightedIndex
                                ScrollIndicator.vertical: ScrollIndicator { }
                            }
                            background: Rectangle {
                                color:  comboboxColor
                                radius: 10
                            }
                        }
                    }
                }
                ColumnLayout {
                    spacing: 20
                    Layout.topMargin: 14
                    Text {
                         text: "MISCELLANEOUS"
                         color: textColor
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         font.family: regularInterFont
                         Layout.alignment: Qt.AlignLeft
                     }
                    CheckBox {
                        id: miscellaneous_checkbox
                        text: qsTr("Use Discord rich presence")
                        height: 40
                        indicator: Rectangle {
                            implicitWidth: 20
                            implicitHeight: 20
                            x: miscellaneous_checkbox.leftPadding + 4
                            y: parent.height / 2 - height / 2
                            radius: 6
                            color: backgroundColor
                            border.color: textColor

                            Rectangle {
                                width: 10
                                height: 10
                                x: 5
                                y: 5
                                radius: 2
                                color: "white"
                                visible: miscellaneous_checkbox.checked
                            }
                        }

                        contentItem: Text {
                            text: miscellaneous_checkbox.text
                            font.pixelSize: 14
                            font.family: regularInterFont
                            opacity: enabled ? 1.0 : 0.3
                            color: "white"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: miscellaneous_checkbox.indicator.width + 16
                        }
                    }
                }
                RowLayout {
                    Layout.topMargin: 10
                    spacing: generalMainLayout.width / 2 + 60
                    TextField {
                        id: miscellaneous_field
                        placeholderText: qsTr("Console IP Filter")
                        color: "white"
                        font.pixelSize: 14
                        leftPadding: 24
                        background: Rectangle {
                            implicitWidth: 240
                            implicitHeight: 40
                            color: textfieldColor
                            radius: 10
                        }
                        Layout.alignment: Qt.AlignLeft
                    }
                    Button {
                        id: logout
                        text: qsTr("Log Out")
                        contentItem: Text {
                            text: logout.text
                            leftPadding: 20
                            font.bold: true
                            font.family: mediumInterFont
                            font.pixelSize: 13
                            opacity: enabled ? 1.0 : 0.3
                            color:  "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        RowLayout {
                            spacing: 5
                            id: iconLayout_logout
                            anchors.leftMargin: 13
                            anchors.topMargin: 3
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            Image {
                                id: logout_icon
                                source: "/assets/ic_settings_power_24px.png" // Path to your icon file
                                sourceSize.width: 20
                                sourceSize.height: 20
                                opacity: enabled ? 1.0 : 0.3
                            }
                            ColorOverlay {
                                anchors.fill: logout_icon
                                source: logout_icon
                                color: "white"  // make image like it lays under red glass
                            }
                        }

                        background: Rectangle {
                            implicitWidth: 106
                            implicitHeight: 32
                            color: "#BF2500"
                            opacity: enabled ? 1 : 0.3
                            radius: 8
                        }
                    }
                }

            }
            //-----------------------------------Interface---------------------------------------------------//
            ColumnLayout {
                Layout.leftMargin: 24
                Layout.topMargin: 16
                visible: pageNumber == 2 ? true : false

                ColumnLayout {
                    Text {
                         text: "UI"
                         color: textColor
                         font.family: regularInterFont
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         Layout.alignment: Qt.AlignLeft
                     }
                    ColumnLayout {
                        Layout.topMargin: 20
                        Layout.leftMargin: 5
                        spacing: 10
                        CheckBox {
                            id: uiChechBox_1
                            text: qsTr("Show flags")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: uiChechBox_1.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: uiChechBox_1.checked
                                }
                            }

                            contentItem: Text {
                                text: uiChechBox_1.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: uiChechBox_1.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: uiChechBox_2
                            text: qsTr("Show DDoS protected")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: uiChechBox_2.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: uiChechBox_2.checked
                                }
                            }

                            contentItem: Text {
                                text: uiChechBox_2.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: uiChechBox_2.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: uiChechBox_3
                            text: qsTr("Show labels by default")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: uiChechBox_3.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: uiChechBox_3.checked
                                }
                            }

                            contentItem: Text {
                                text: uiChechBox_3.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: uiChechBox_3.indicator.width + 16
                            }
                        }
                    }
                }
                ColumnLayout {
                    Layout.topMargin: 20
                    Text {
                         text: "TABS"
                         color: textColor
                         font.family: regularInterFont
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         Layout.alignment: Qt.AlignLeft
                     }
                    ColumnLayout {
                        spacing: 10
                        Layout.topMargin: 20
                        Layout.leftMargin: 5
                        CheckBox {
                            id: tabsChechBox_1
                            text: qsTr("PlayStation")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: tabsChechBox_1.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: tabsChechBox_1.checked
                                }
                            }

                            contentItem: Text {
                                text: tabsChechBox_1.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: tabsChechBox_1.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: tabsChechBox_2
                            text: qsTr("Xbox")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: tabsChechBox_2.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: tabsChechBox_2.checked
                                }
                            }

                            contentItem: Text {
                                text: tabsChechBox_2.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: tabsChechBox_2.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: tabsChechBox_3
                            text: qsTr("Filtered Games")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: tabsChechBox_3.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: tabsChechBox_3.checked
                                }
                            }

                            contentItem: Text {
                                text: tabsChechBox_3.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: tabsChechBox_3.indicator.width + 16
                            }
                        }
                        CheckBox {
                            id: tabsChechBox_4
                            text: qsTr("Other Info")
                            indicator: Rectangle {
                                implicitWidth: 20
                                implicitHeight: 20
                                x: tabsChechBox_4.leftPadding
                                y: parent.height / 2 - height / 2
                                radius: 6
                                color: backgroundColor
                                border.color: textColor

                                Rectangle {
                                    width: 10
                                    height: 10
                                    x: 5
                                    y: 5
                                    radius: 2
                                    color: "white"
                                    visible: tabsChechBox_4.checked
                                }
                            }

                            contentItem: Text {
                                text: tabsChechBox_4.text
                                font.pixelSize: 13
                                font.family: regularInterFont
                                opacity: enabled ? 1.0 : 0.3
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: tabsChechBox_4.indicator.width + 16
                            }
                        }
                    }


                }
                ColumnLayout {
                    Layout.topMargin: 24
                    Text {
                         text: "ROW SIZE"
                         color: textColor
                         font.family: regularInterFont
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         Layout.alignment: Qt.AlignLeft
                     }
                    RowLayout {
                        Layout.topMargin: 20
                        ComboBox {
                            id: rowSize_combobox
                            model: ["Small", "Medium", "Large"]
                            delegate: ItemDelegate {
                                id: itemText_RowSize
                                contentItem: Text {
                                    text: modelData
                                    color: itemText_RowSize.focus ? "white" : labelColor
                                    font.pixelSize: 14
                                    font.family: regularInterFont
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
                                highlighted: rowSize_combobox.highlightedIndex === index
                            }

                            indicator: Canvas {
                                id: canvas_rowsize
                                x: rowSize_combobox.width - width - 25
                                y: rowSize_combobox.topPadding + (rowSize_combobox.availableHeight - height) / 2
                                width: 12
                                height: 8
                                contextType: "2d"

                                Connections {
                                    target: rowSize_combobox
                                    onPressedChanged: canvas_rowsize.requestPaint()
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
                                leftPadding: 24
                                rightPadding: rowSize_combobox.indicator.width + rowSize_combobox.spacing
                                text: rowSize_combobox.displayText
                                font.family: regularInterFont
                                font.pixelSize: 14
                                color: "white"
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignLeft
                            }

                            background: Rectangle {
                                implicitWidth: 480
                                implicitHeight: 44
                                color:  comboboxColor
                                radius: 10
                            }

                            popup: Popup {
                                y: rowSize_combobox.height - 1
                                width: rowSize_combobox.width
                                implicitHeight: contentItem.implicitHeight
                                topPadding:  1
                                contentItem: ListView {
                                    clip: true
                                    implicitHeight: contentHeight
                                    model: rowSize_combobox.popup.visible ? rowSize_combobox.delegateModel : null
                                    currentIndex: rowSize_combobox.highlightedIndex
                                    ScrollIndicator.vertical: ScrollIndicator { }
                                }
                                background: Rectangle {
                                    color:  comboboxColor
                                    radius: 10
                                }
                            }
                        }
                    }

                }
                }
           //-----------------------------------Game Filtering Page------------------------------------------//
            ColumnLayout {
                spacing: 15
                visible: pageNumber == 3 ? true: false
                ColumnLayout {
                    Layout.leftMargin: 24
                    Layout.topMargin: 16
                    RowLayout{
                        Layout.fillWidth: true
                        height: 40
                        Repeater {
                            model: 3 // Number of columns excluding the icon column
                            Rectangle {
                                height: parent.height
                                color: backgroundColor
                                width: [
                                    320, // ip address
                                    160, // country
                                    350, // city
                                ][index]
                                Label {
                                    text: [
                                       "NAME", // ip address
                                       "TYPE", // country
                                       "CONSOLE", // city
                                   ][index]

                                    font.letterSpacing: 1.5
                                    font.pixelSize: 13
                                    font.family: regularInterFont
                                    color: "#6D6D6E"
//                                    anchors.centerIn: parent
                                    anchors.left: index === 0 ? parent.left :
                                                  index === 1 ? parent.left :
                                                  parent.left
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.leftMargin: index === 1 ? 40 :
                                                        index === 2 ? 30 :
                                                         0
                                }
                                Rectangle {
                                  width: parent.width + 7
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
                        columnSpacing: 3
                        Layout.fillWidth: true
                        height: 470
                        clip: true
                        model: GameModel {}
                        delegate: Rectangle {
                            implicitHeight: 48
                            color: backgroundColor
                            Rectangle {
                                anchors.fill: parent // Ensure the rectangle fills the delegate
                                anchors.topMargin: 10
                                anchors.bottomMargin: 10
                                anchors.leftMargin: if(column === 1 | column === 2) return 40
                                anchors.rightMargin: 40
                                color: column === 1 ? gameTableCellColor : backgroundColor
                                radius: 20// Set the background color for the text
                                Text {
                                    text: display
                                    color: "white"
                                    font.family: regularInterFont
                                    font.pixelSize: 14
                                    anchors.centerIn: if(column === 1) return parent
                                }
                            }
                            Rectangle {
                              width: parent.width + 3
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
                            } else if(column === 1){
                                return 160
                            }  else {
                                return 360
                            }
                        }
                    }

                }
            }
            //-----------------------------------Packet Filtering Page---------------------------------------//
            ColumnLayout {
                Layout.leftMargin: 24
                Layout.topMargin: 14
                visible: pageNumber == 4 ? true : false
                Text {
                     text: "FILTERED POSTS"
                     color: textColor
                     font.family: mediumInterFont
                     font.letterSpacing: 2
                     font.pixelSize: 15
                     Layout.alignment: Qt.AlignLeft
                 }
                RowLayout {
                    Layout.topMargin: 20
                    Button {
                        id: add_packet
                        visible: showIndexPacket == false ? true : false
                        text: qsTr("ADD")
                        contentItem: Text {
                            text: add_packet.text
                            leftPadding: 20
                            font.bold: true
                            font.family: mediumInterFont
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
                            anchors.leftMargin: 24
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            Image {
                                id: addIconPacket
                                source: "/assets/ic_add_24px.png" // Path to your icon file
                                width: 20
                                height: 20
                                opacity: enabled ? 1.0 : 0.3
                            }
                            ColorOverlay {
                                anchors.fill: addIconPacket
                                source: addIconPacket
                                color: "white"  // make image like it lays under red glass
                            }
                        }

                        background: Rectangle {
                            implicitWidth: 111
                            implicitHeight: 48
                            color: add_packet.down ? "#145174" : "#158FD4"
                            opacity: enabled ? 1 : 0.3
                            radius: 8
                        }
                        onClicked: {
                            showIndexPacket = true
                        }
                    }
                    RowLayout {
                        spacing: 20
                        visible: showIndexPacket == true ? true : false
                        TextField {
                            id: newTagPacket
                            placeholderText: qsTr("New Tag...")
                            font.pixelSize: 14
                            font.family : lightInterFont
                            color: "white"
                            leftPadding: 16
                            background: Rectangle {
                                implicitWidth: 146
                                implicitHeight: 41
                                color: textfieldColor
                                radius: 8
                            }
                            onTextChanged: {
                                newText = text
                            }
                        }
                        Button {
                            id: showed_add_packet
                            text: qsTr("ADD")
                            contentItem: Text {
                                text: showed_add_packet.text
                                font.family: mediumInterFont
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color:  "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                            background: Rectangle {
                                implicitWidth: 55
                                implicitHeight: 40
                                color: showed_add_packet.down ? "#145174" : "#158FD4"
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                            onClicked: {

                            }
                        }

                    }
                }
                ColumnLayout {
                    Layout.topMargin: 56
                    Text {
                        topPadding: 20
                         text: "PACKET TYPES"
                         color: textColor
                         font.family: mediumInterFont
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         Layout.alignment: Qt.AlignLeft
                     }
                    ColumnLayout {
                        Layout.topMargin: 20
                        Layout.leftMargin: 10
                        ButtonGroup {
                            id: packetCheckboxGroup
                        }
                        ColumnLayout {
                            spacing: 5
                            CheckBox {
                                id: udpCheckbox
                                ButtonGroup.group: packetCheckboxGroup
                                text: qsTr("Show UDP Packets")
                                indicator: Rectangle {
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    x: udpCheckbox.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 6
                                    color: backgroundColor
                                    border.color: textColor

                                    Rectangle {
                                        width: 10
                                        height: 10
                                        x: 5
                                        y: 5
                                        radius: 2
                                        color: "white"
                                        visible: udpCheckbox.checked
                                    }
                                }

                                contentItem: Text {
                                    text: udpCheckbox.text
                                    font.pixelSize: 13
                                    font.family: regularInterFont
                                    opacity: enabled ? 1.0 : 0.3
                                    color: "white"
                                    verticalAlignment: Text.AlignVCenter
                                    leftPadding: udpCheckbox.indicator.width + 16
                                }
                            }
                            CheckBox {
                                id: tcpCheckbox
                                ButtonGroup.group: packetCheckboxGroup
                                text: qsTr("Show TCP Packets")
                                indicator: Rectangle {
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    x: tcpCheckbox.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 6
                                    color: backgroundColor
                                    border.color: textColor

                                    Rectangle {
                                        width: 10
                                        height: 10
                                        x: 5
                                        y: 5
                                        radius: 2
                                        color: "white"
                                        visible: tcpCheckbox.checked
                                    }
                                }

                                contentItem: Text {
                                    text: tcpCheckbox.text
                                    font.family: regularInterFont
                                    font.pixelSize: 13
                                    opacity: enabled ? 1.0 : 0.3
                                    color: "white"
                                    verticalAlignment: Text.AlignVCenter
                                    leftPadding: tcpCheckbox.indicator.width + 16
                                }
                            }

                        }
                    }
                }
            }
            //-----------------------------------Tab Filtering Page------------------------------------------//
            ColumnLayout {
                Layout.leftMargin: 24
                Layout.topMargin: 14
                visible: pageNumber == 5 ? true : false
                Text {
                     text: "FILTERED POSTS"
                     color: textColor
                     font.family: mediumInterFont
                     font.letterSpacing: 2
                     font.pixelSize: 15
                     Layout.alignment: Qt.AlignLeft
                 }
                RowLayout {
                    Layout.topMargin: 20
                    Button {
                        id: add_tab
                        visible: showIndexTab == false ? true : false
                        text: qsTr("ADD")
                        contentItem: Text {
                            text: add_tab.text
                            leftPadding: 20
                            font.bold: true
                            font.family: mediumInterFont
                            font.pixelSize: 14
                            opacity: enabled ? 1.0 : 0.3
                            color:  "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        RowLayout {
                            spacing: 5
                            id: iconTabLayout
                            anchors.leftMargin: 24
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            Image {
                                id: addIconTab
                                source: "/assets/ic_add_24px.png" // Path to your icon file
                                width: 20
                                height: 20
                                opacity: enabled ? 1.0 : 0.3
                            }
                            ColorOverlay {
                                anchors.fill: addIconTab
                                source: addIconTab
                                color: "white"  // make image like it lays under red glass
                            }
                        }

                        background: Rectangle {
                            implicitWidth: 111
                            implicitHeight: 48
                            color: add_tab.down ? "#145174" : "#158FD4"
                            opacity: enabled ? 1 : 0.3
                            radius: 8
                        }
                        onClicked: {
                            showIndexTab = true
                        }
                    }
                    RowLayout {
                        spacing: 20
                        visible: showIndexTab == true ? true : false
                        TextField {
                            id: newTagTab
                            font.pixelSize: 14
                            font.family : lightInterFont
                            placeholderText: qsTr("New Tag...")
                            color: "white"
                            leftPadding: 16
                            background: Rectangle {
                                implicitWidth: 146
                                implicitHeight: 41
                                color: textfieldColor
                                radius: 8
                            }
                            onTextChanged: {
                                newText = text
                            }
                        }
                        Button {
                            id: showed_add_tab
                            text: qsTr("ADD")
                            contentItem: Text {
                                text: showed_add_tab.text
                                font.family: mediumInterFont
                                font.pixelSize: 14
                                opacity: enabled ? 1.0 : 0.3
                                color:  "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }
                            background: Rectangle {
                                implicitWidth: 55
                                implicitHeight: 40
                                color: showed_add_tab.down ? "#145174" : "#158FD4"
                                opacity: enabled ? 1 : 0.3
                                radius: 8
                            }
                            onClicked: {

                            }
                        }

                    }
                }
                ColumnLayout {
                    Layout.topMargin: 56
                    Text {
                        topPadding: 20
                         text: "PACKET TYPES"
                         color: textColor
                         font.letterSpacing: 2
                         font.pixelSize: 15
                         font.family: mediumInterFont
                         Layout.alignment: Qt.AlignLeft
                     }
                    ColumnLayout {
                        Layout.topMargin: 20
                        Layout.leftMargin: 10
                        spacing: 10
                        ButtonGroup {
                            id: tabCheckboxGroup
                        }
                        ColumnLayout {
                            spacing: 5
                            CheckBox {
                                id: udpTabCheckbox
                                ButtonGroup.group: tabCheckboxGroup
                                text: qsTr("Show UDP Packets")
                                indicator: Rectangle {
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    x: udpTabCheckbox.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 6
                                    color: backgroundColor
                                    border.color: textColor

                                    Rectangle {
                                        width: 10
                                        height: 10
                                        x: 5
                                        y: 5
                                        radius: 2
                                        color: "white"
                                        visible: udpTabCheckbox.checked
                                    }
                                }

                                contentItem: Text {
                                    text: udpTabCheckbox.text
                                    font.family: regularInterFont
                                    font.pixelSize: 13
                                    opacity: enabled ? 1.0 : 0.3
                                    color: "white"
                                    verticalAlignment: Text.AlignVCenter
                                    leftPadding: udpTabCheckbox.indicator.width + 16
                                }
                            }
                            CheckBox {
                                id: tcpTabCheckbox
                                ButtonGroup.group: tabCheckboxGroup
                                text: qsTr("Show TCP Packets")
                                indicator: Rectangle {
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    x: tcpTabCheckbox.leftPadding
                                    y: parent.height / 2 - height / 2
                                    radius: 6
                                    color: backgroundColor
                                    border.color: textColor

                                    Rectangle {
                                        width: 10
                                        height: 10
                                        x: 5
                                        y: 5
                                        radius: 2
                                        color: "white"
                                        visible: tcpTabCheckbox.checked
                                    }
                                }

                                contentItem: Text {
                                    text: tcpTabCheckbox.text
                                    font.family: regularInterFont
                                    font.pixelSize: 13
                                    opacity: enabled ? 1.0 : 0.3
                                    color: "white"
                                    verticalAlignment: Text.AlignVCenter
                                    leftPadding: tcpTabCheckbox.indicator.width + 16
                                }
                            }
                        }
                    }
                }
            }
            //------------------------------------Saved Labels---------------------------------------------//
            ColumnLayout {
                id: savedLabelsLayout
                Layout.topMargin: 16
                visible: pageNumber == 6 ? true : false
                ColumnLayout {
                    Layout.leftMargin: 689
                    Button {
                        id: create_label
                        text: qsTr("Create New Label")
                        contentItem: Text {
                            text: create_label.text
                            leftPadding: 20
                            font.bold: true
                            font.family: mediumInterFont
                            font.pixelSize: 13
                            opacity: enabled ? 1.0 : 0.3
                            color:  "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        RowLayout {
                            spacing: 5
                            id: createLabelIconLayout
                            anchors.leftMargin: 10
                            anchors.top: parent.top
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            Image {
                                id: addIconCreateLabel
                                source: "/assets/ic_add_24px.png" // Path to your icon file
                                sourceSize.width : 20
                                sourceSize.height : 20
                                opacity: enabled ? 1.0 : 0.3
                            }
                            ColorOverlay {
                                anchors.fill: addIconCreateLabel
                                source: addIconCreateLabel
                                color: "white"  // make image like it lays under red glass
                            }
                        }

                        background: Rectangle {
                            implicitWidth: 172
                            implicitHeight: 32
                            color: create_label.down ? "#145174" : "#158FD4"
                            opacity: enabled ? 1 : 0.3
                            radius: 8
                        }
                        onClicked: {

                        }
                    }
                }
                ColumnLayout {
                    id: labelsTableViewLayout
                    width: labelsTableViewLayout.width
                    Layout.leftMargin: 24
                    Layout.topMargin: 10
                    RowLayout{
                        Layout.fillWidth: true
                        height: 40
                        spacing: 3
                        Repeater {
                            model: 2
                            Rectangle {
                                height: parent.height
                                color: backgroundColor
                                width: [
                                    320,
                                    320,
                                ][index]
                                Label {
                                    text: [
                                       "NAME",
                                       "CONSOLE",
                                   ][index]
                                    font.letterSpacing: 1.5
                                    font.pixelSize: 13
                                    color: "#6D6D6E"
                                    anchors.left: parent.left
                                    anchors.leftMargin: if(index === 1) return 100
                                }
                                Rectangle {
                                  width: parent.width + 200
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
                        columnSpacing: 3
                        Layout.fillWidth: true
                        height: 470
                        clip: true
                        model: LabelsModel {}
                        delegate: Rectangle {
                            implicitWidth: 150
                            implicitHeight: 40
                            color: backgroundColor
                            Text {
                                text: display
                                color: "white"
                                font.family: regularInterFont
                                font.pixelSize: 14
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: if(column === 1 ) return 100
                            }
                            Rectangle {
                              width: parent.width + 200
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
                                return 320
                            }

                        }
                    }
                }
            }
            //-----------------------------------keyboard shortcuts-----------------------------------------//
            ColumnLayout {
                visible: pageNumber == 7 ? true : false
            }
        }
    }
}
