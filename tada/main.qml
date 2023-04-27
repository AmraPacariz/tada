import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick 2.7

ApplicationWindow {
    property int clickedItemIndex: -1
    id:root
    visible: true
    property int windowWidth: 800
    property int windowHeight: 800
    width: windowWidth
    height: windowHeight
    title: qsTr("TA-DA")
    color: "white"
    header: Row {
        id:row1
        spacing: 10
        width: parent.width
        height: 50
        anchors.leftMargin: 5


        Image {
            id: imagelogo
            source: "https://static.vecteezy.com/system/resources/previews/001/200/261/non_2x/check-png.png"
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 40
        }
        Text {
            text: "My Lists"
            id:myListstext
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            color: "black"
            font.pixelSize: 20
            MouseArea {
                anchors.fill: parent
                onClicked: {
                  while (stackView.depth > 1) {
                    stackView.pop();
                  }
                }

            }
        }
        Text {
            text: "Create new list"
            font.pixelSize: 14
            color: "red"
            font.underline: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin:  10
            MouseArea {
                anchors.fill: parent
                onClicked: stackView.push("Page2.qml")
            }
        }
    }


    StackView  {
        id: stackView
        anchors.fill: parent
        anchors.top:row1.bottom
        anchors.margins: 10
        initialItem: "Page1.qml"
        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 100
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 100
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 100
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 100
            }
        }
    }
}
