import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.0
import LoginHandler 1.0
Rectangle {
    id: loginPage
    width: 1440
    height: 800
    color: "#141315"
    anchors.fill: parent
    FontLoader {
        id: myFontLoader
        source: "/fonts/Inter-Medium.ttf"
    }
    LoginHandler {
        id: loginHandler
    }
    property string generalFont: myFontLoader.name
    property string textColor: "#888788"
    property string fieldColor: "#1D1C1E"
    property string token: ""
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20
        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Image {
                source: "assets/OctoSniff.png"
                width: 169
                height: 33
            }
        }
        RowLayout {
            spacing: 5
            ColumnLayout {
                spacing: 12
                Text {
                    id: usernameText
                    text: qsTr("Username")
                    color: textColor
                    leftPadding: 14
                    font.pixelSize: 12
                    font.family: generalFont
                }
                TextField {
                    id: username
                    placeholderText: qsTr("Username")
                    font.pixelSize: 14
                    font.family: generalFont
                    color: "white"
                    background: Rectangle {
                        implicitWidth: 400
                        implicitHeight: 40
                        color: fieldColor
                        radius: 8
                    }
                }
                Text {
                    id: passwordText
                    text: qsTr("Password")
                    color: textColor
                    leftPadding: 14
                    font.pixelSize: 12
                    font.family: generalFont
                }
                TextField {
                    id: password
                    placeholderText: qsTr("Password")
                    font.pixelSize: 14
                    font.family: generalFont
                    color: "white"
                    width: screen.width / 8
                    background: Rectangle {
                        implicitWidth: 400
                        implicitHeight: 40
                        color: fieldColor
                        radius: 8
                    }
                    Image {
                        id: showPasswordIcon
                        source: "assets/showPassword.png" // Set the path the icon image
                        sourceSize.width: 20 // Set the width of the icon
                        sourceSize.height: 20 // Set the height of the icon
                        anchors {
                            right: password.right // Position the icon to the right of the TextField
                            rightMargin: 10 // Adjust the margin as needed
                            verticalCenter: password.verticalCenter
                        }

                    }
                    ColorOverlay {
                        anchors.fill: showPasswordIcon
                        source: showPasswordIcon
                        color: textColor  // make image like it lays under red glass
                    }
                }
            }
        }
        Button {
            id: login
            text: qsTr("Login")
            contentItem: Text {
                text: login.text
                font.bold: true
                font.family: generalFont
                font.letterSpacing: 1
                font.pixelSize: 14
                opacity: enabled ? 1.0 : 0.3
                color: login.down ? "white" : "#89898A"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: username.width
                implicitHeight: username.height
                color: login.down ? "#158FD4" : "#145174"
                opacity: enabled ? 1 : 0.3
                radius: 8
            }
            onClicked: {
                loginHandler.login(username.text, password.text);
//                stackView.push( Qt.resolvedUrl("MainPage.qml") )
            }
        }
        Text {
            id: statusText
            text: token !== "" ? "Logged in!"+token : "Login failed."+token
            font.bold: true
        }
        RowLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Text {
                text: qsTr("or continue with")
                color: textColor
                font.pixelSize: 11
                font.family: generalFont
            }
        }
        RowLayout {
            spacing: 12
            Button {
                id: login_1
                icon.source: "/assets/loginIcon_3.png"
                icon.color: "white"
                icon.width: 26
                icon.height: 26
                background: Rectangle {
                    implicitWidth: 125
                    implicitHeight: 64
                    color: login_1.down ? "#158FD4" : "#027D01"
                    opacity: enabled ? 1 : 0.3
                    radius: 6
                }
            }
            Button {
                id: login_2
                icon.source: "/assets/loginIcon_2.png"
                icon.color: "white"
                icon.width: 35
                icon.height: 39
                background: Rectangle {
                    implicitWidth: 125
                    implicitHeight: 64
                    color: login_2.down ? "#5865F2" : "#158FD5"
                    opacity: enabled ? 1 : 0.3
                    radius: 6
                }
            }
            Button {
                id: login_3
                icon.source: "/assets/loginIcon_1.png"
                icon.color: "white"
                icon.width: 33
                icon.height: 27
                background: Rectangle {
                    implicitWidth: 125
                    implicitHeight: 64
                    color: login_3.down ? "#027D01" : "#5865F2"
                    opacity: enabled ? 1 : 0.3
                    radius: 6
                }
            }
        }
    }
//    Component.onCompleted: {
//        loginHandler.loginSuccess.connect(loginPage.onLoginSuccess);
//        loginHandler.loginFailure.connect(loginPage.onLoginFailure);
//    }

    function onLoginSuccess(token) {
        loginPage.token = token;
    }

    function onLoginFailure() {
        loginPage.token = "";
    }
}
