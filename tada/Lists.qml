import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Lists 1.0
import QtQuick.Controls.Material 2.0
Item{

    ///------------------Lista so site listi kje sedi tuka ---------------///

    ListView {
        id: listView
        width: windowWidth
        height:windowHeight*0.5
        anchors.top: row1.bottom
        clip: true
        model: ListsModel {
            list: doLists
        }
        delegate: Item {
            id:itemList
            height: 30
            width:listView.width

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    clickedItemIndex = index;
                    stackView.push("Page3.qml")
                    clickedItemName=imeLista.text

                }
            }
            Rectangle{
                id:rec
                width: 3
                height: parent.height
                anchors.verticalCenter: itemList.verticalCenter
                Rectangle{
                    id:circle
                    color: "gray"
                    width: model.number+3
                    height: model.number+3
                    radius: width*0.5
                    anchors.verticalCenter: parent.verticalCenter

                }
            }


            Text {
                id:imeLista
                font.bold: true
                font.underline: true
                color: "darkblue"
                x: rec.width + 20
                y: 5
                width: rec.width+100
                height: rec.height
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: itemList.verticalCenter
                text: model.name
            }
            Text
            {
                id:numberofitems
                x: rec.width + imeLista.width
                y: 5
                font.bold: true
                font.pixelSize: 10
                color: "grey"
                text: " - "+ model.number
                anchors.verticalCenter: itemList.verticalCenter

            }

        }
    }
}



