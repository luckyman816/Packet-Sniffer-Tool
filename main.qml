import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
ApplicationWindow {
    id: window
    visible: true
    width: 1440
    height: 810
    flags: Qt.FramelessWindowHint
    Rectangle {
        width: screen.width
        height: screen.height
        color: "#141315"
    }
    StackView {
        id: stackView
        anchors.fill: parent

        initialItem:  Qt.resolvedUrl("LoginPage.qml")
    }
}
