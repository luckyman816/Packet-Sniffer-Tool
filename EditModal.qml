// ModalDialog.qml
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0
Dialog {

    id: modalDialog
    width: 148
    height: 72
    padding: 0

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
    property string textColor: "#89898A"
    property string dialogBackground : "#1D1C1E"
    property string backgroundColor: "#141315"
    background: Rectangle {
        width: parent.width
        height: parent.height
        color: dialogBackground
        radius: 8
    }
    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        RowLayout {
            spacing: 10
            Image {
                source: "assets/editIcon.png"
                sourceSize.width: 16
                sourceSize.height: 16
            }
            Text {
                text: qsTr("Edit Row")
                font.pixelSize: 14
                font.family: regularInterFont
                color: textColor
            }
        }
        RowLayout {
            spacing: 10
            Image {
                source: "assets/deleteIcon.png"
                sourceSize.width: 16
                sourceSize.height: 16
            }
            Text {
                text: qsTr("Delete Row")
                font.pixelSize: 14
                font.family: regularInterFont
                color: textColor
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    deleteDialog.open()
                    modalDialog.close()
                }
            }
        }

    }

    property int mouseX
    property int mouseY

    onVisibleChanged: {
        if (visible) {
            modalDialog.x = mouseX
            modalDialog.y = mouseY
        }
    }
    Popup {
           id: deleteDialog
           modal: true
           focus: true
           visible: false
           width: 496
           height: 292
           padding: 0
           bottomInset: 0
           leftInset: 0
           topInset: 0
           rightInset: 0
           x: (parent.width - width )/ 2
           y: (parent.height - height) / 2
           background: Rectangle {
            radius: 12
            color: backgroundColor
           }
           Loader {
               id: deleteDialogLoader
               source: "DeleteDialog.qml"
               anchors.fill: parent
        }
    }
}
