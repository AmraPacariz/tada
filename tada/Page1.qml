import QtQuick 2.0
import QtQuick.Controls 2.15
Item{

    ///------------------Lista so site listi kje sedi tuka ---------------///

    ListView {
        id: listView
        width: parent.width
        height: parent.height*0.5
        anchors.top: row1.bottom
        model: myList
        delegate: Item {
            height: 40
            width: parent.width
            Rectangle {

                width: parent.width
                height: 1
                color: "lightgrey"

            }
            Rectangle {
                id: circle
                x: 10
                y: 5
                width: 20
                height: 20
                color: "lightgrey"
                radius: width/2
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
                text: model.text

            }
           Button {
                text: "Delete"
                height: parent.height*0.8
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    myList.remove(index)
                }
            }
        }
    }


}
