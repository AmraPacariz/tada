import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


import ToDo 1.0
Item {
    anchors.fill: parent
    ColumnLayout {

        Layout.fillWidth: true

        ListView {
            id:listViewToDo
            implicitWidth: 250
            implicitHeight: 250
            anchors.fill: parent
            clip: true

            model: ToDoModel {
                list: toDoList
            }

            delegate: RowLayout {
               width:listViewToDo.width

                CheckBox {
                    checked: model.done
                    onClicked: model.done = checked
                }
                Text {
                    text: model.description
                    // onEditingFinished: model.description = text
                    Layout.fillWidth: true
                }
            }

        }
        RowLayout{AddItem{}}
  }

}
