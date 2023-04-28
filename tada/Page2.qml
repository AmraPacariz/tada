import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0
///------------------dodadi nova lista formular-------

Item {


    Text {
        id: naslov1
        text: "Name your new list"
        font.pixelSize: 20
        font.bold: true
        color: "black"
    }

    TextField {
        id: listNameInput
        anchors.top: naslov1.bottom
        width: 200
        placeholderText: "Enter list name"
    }
    Row{
        id:row2
        spacing: 10
        width: parent.width
        height:50
        anchors.top: listNameInput.bottom
        RoundButton {
            id:addBtn
            text: "Create this list"
            anchors.verticalCenter: parent.verticalCenter
            radius:50
            onClicked: {
                doLists.appendItem(listNameInput.text)
                listNameInput.text = ""
                stackView.push("Page1.qml")
            }
        }
        Text {
            id: or
            text: "or"
            font.pixelSize: 15
            color: "black"
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            id:cancelTxt
            text: "Cancel"
            color: "red"
            font.pixelSize: 15
            font.underline: true
            anchors.verticalCenter: parent.verticalCenter


            MouseArea {
                anchors.fill: parent
                onClicked: stackView.push("Page1.qml")
            }
        }
    }

}


