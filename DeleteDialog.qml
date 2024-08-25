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
    property string textColor: "#89898A"
    property string buttonTextColor: "#1D1C1E"
    Rectangle {
        id: deleteDialog
        width: 496
        height: 292
        color: backgroundColor
        anchors.fill: parent
        radius: 12
        ColumnLayout {
            id: deleteMainLayout
            width: deleteDialog.width
            height: deleteDialog.height
            spacing: 16
            RowLayout{
                Layout.topMargin: 24
                Layout.alignment: Qt.AlignHCenter
                Image {
                    source: "assets/warningIcon.png"
                    sourceSize.width: 64
                    sourceSize.height: 64
                }
            }
            ColumnLayout {
                width: deleteDialog.width
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                spacing: 8
                RowLayout {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    Text {
                        text: qsTr("Are you sure you want to delete this row?")
                        font.family: regularInterFont
                        font.pixelSize: 15
                        color: "white"
                    }
                }
               RowLayout {
                   Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                   Text {
                       text: qsTr("You will be able to undo this action")
                       font.family: regularInterFont
                       font.pixelSize: 12
                       color: textColor
                   }
               }
            }
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: 24
                spacing: 16
                Button {
                    id: cancelButton
                    text: qsTr("Cancel")
                    contentItem: Text {
                        text: cancelButton.text
                        font.family: mediumInterFont
                        font.pixelSize: 14
                        opacity: enabled ? 1.0 : 0.3
                        color:  "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    background: Rectangle {
                        implicitWidth: 192
                        implicitHeight: 36
                        color: buttonTextColor
                        opacity: enabled ? 1 : 0.3
                        radius: 8
                    }
                    onClicked: {

                    }
                }
                Button {
                    id: proceedButton
                    text: qsTr("Proceed")
                    contentItem: Text {
                        text: proceedButton.text
                        font.family: mediumInterFont
                        font.pixelSize: 14
                        opacity: enabled ? 1.0 : 0.3
                        color:  "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    background: Rectangle {
                        implicitWidth: 192
                        implicitHeight: 36
                        color: proceedButton.down ? "#145174" : "#158FD4"
                        opacity: enabled ? 1 : 0.3
                        radius: 8
                    }
                    onClicked: {

                    }
                }
            }
        }
    }
}
