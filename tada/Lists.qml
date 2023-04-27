import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Lists 1.0
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
            width: parent.width

            Rectangle {
                width: parent.width-20
                height: 1
                color: "lightgrey"

            }
            Rectangle{
                id:circle
                color: "gray"
                width: model.number
                height: model.number
                radius: width*0.5
                anchors.verticalCenter: itemList.verticalCenter
            }
            Text {
                id:imeLista
                font.bold: true
                font.underline: true
                color: "darkblue"
                x: circle.width + 20
                y: 5
                width: parent.width - circle.width - 20
                height: circle.height
                verticalAlignment: Text.AlignVCenter
                anchors.verticalCenter: itemList.verticalCenter
                text: model.name

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                          clickedItemIndex = index;
                       console.log("Clicked element index:" + clickedItemIndex);
                        stackView.push("Page3.qml")

                    }
                }

            }

        }
    }
}



