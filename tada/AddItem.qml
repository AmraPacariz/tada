import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import ToDo 1.0
Item {

    Text {
        id:removeItem
        anchors.verticalCenter: parent.verticalCenter
        text: qsTr("Remove completed items")
        font.bold: true
        font.underline: true
        color: "darkblue"
        MouseArea {
            anchors.fill: parent
            onClicked: toDoList.removeCompletedItems()
        }

        Layout.fillWidth: true
    }
    Text {
        id: naslov
        anchors.top: removeItem.bottom
        text: "Add Item"
        font.pixelSize: 20
        font.bold: true
        color: "black"
    }

    TextField {
        id: listItemNameInput
        anchors.top: naslov.bottom
        width: 200
        placeholderText: "Enter Item Name"
    }
    Row{
        id:row2
        spacing: 10
        width: parent.width
        height:50
        anchors.top: listItemNameInput.bottom
        RoundButton {
            id:addItemBtn
            text: "Add Item"
            anchors.verticalCenter: parent.verticalCenter
            radius:50
            onClicked: {
                toDoList.appendItem(listItemNameInput.text, clickedItemIndex)
                listItemNameInput.text = ""

            }
        }


    }

}

