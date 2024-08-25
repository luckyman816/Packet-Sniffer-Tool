import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
Column {
    id: accordion
    default property alias item: ld.sourceComponent
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
    property string tableSeparatorColor: "#201F23"
    property bool iconIndex : true
    width: 433
    height: 50
        Rectangle {
        width: 433
        height: 50
        color: backgroundColor
        MouseArea {
          anchors.fill: parent
          onClicked: {info.show = !info.show; iconIndex = !iconIndex}
        }
        Text {
            id: name
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            text: qsTr("Is there a free trial available?")
            font.pixelSize: 14
            font.family: regularInterFont
            color: textColor
        }
        Image {
            visible: iconIndex === true  ? true :false
            id: add_icon
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            source: "assets/ic_add_24px.png"
            sourceSize.width: 20
            sourceSize.height: 20

        }
        ColorOverlay {
            visible: iconIndex === true  ? true :false
            anchors.fill: add_icon
            source: add_icon
            color: textColor  // make image like it lays under red glass
        }
        Image {
            visible: iconIndex == false ? true :false
            id: add_clear
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            source: "assets/ic_remove_24px.png"
            sourceSize.width: 20
            sourceSize.height: 20

        }
        ColorOverlay {
            visible: iconIndex == false ? true :false
            anchors.fill: add_clear
            source: add_clear
            color: textColor  // make image like it lays under red glass
        }
       }
        Rectangle {
          id: info
          width: 433
          height: show ? ld.height : 0
          property bool show : false
          color: backgroundColor
          clip: true
          Loader {
            id: ld
            y: info.height - height
            anchors.horizontalCenter: info.horizontalCenter
          }
          Behavior on height {
            NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
          }
        }
        RowLayout {
            id: separatorAccordion
            Rectangle {
                implicitWidth: accordion.width
                implicitHeight: 1
                opacity: enabled ? 1 : 0.3
                radius: 2
                Rectangle {
                    width: accordion.width
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


}
