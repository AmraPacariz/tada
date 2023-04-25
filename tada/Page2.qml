import QtQuick 2.0
import QtQuick.Controls 2.15

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
                myList.append({text: listNameInput.text})
                listNameInput.text = ""
              //  status.visible: true
               // stackView.pop()
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
                onClicked: stackView.pop()
            }
        }
    }
    Text {
        id:status
        text: "New list is created"
        color: "green"
        font.pixelSize: 15
        font.bold: true
        anchors.top:row2.bottom
        visible: false
    }
}

