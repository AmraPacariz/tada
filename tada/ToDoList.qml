import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.0

import ToDo 1.0
import Filter 1.0
import Lists 1.0
Item {
    property bool editMode: false
    Component.onCompleted: {
        fmodel.setFilterRegularExpression(String(clickedItemIndex))

    }
    anchors.fill: parent
    ColumnLayout {


        Text {
            id:namelist
            text: qsTr(clickedItemName)
            font.bold: true
            font.pixelSize : 20
        }
        Text {


            text: editMode ? qsTr("Editing Items") : qsTr("Edit Items")
            font.bold: true
            font.pixelSize: 10
            color: editMode ? "red" : "grey"
            MouseArea {
                anchors.fill: parent
                onClicked: editMode = !editMode}
        }

        Layout.fillWidth: true
        ToDoModel
        {
            list: toDoList
            id:todomodel
        }

        ListView {
            id:listViewToDo
            implicitWidth: 250
            implicitHeight: 250
            clip: true

            model: FilterModel {
                id:fmodel
                sourceModel: todomodel
                dynamicSortFilter: true
            }

            delegate: RowLayout {
                width:listViewToDo.width
                height: 20
                anchors.topMargin: 3
                CheckBox {
                    checked: model.done
                    onClicked: model.done = checked
                }
                TextField {

                    text: model.description
                    onEditingFinished: model.description = text
                    Layout.fillWidth: true
                    readOnly: !editMode
                }
                Text {
                    text: "Delete"
                    visible: editMode
                     color: "lightgray"
                     //font.pixelSize:
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            toDoList.removeItem(model.index)

                        }
                    }
                }
            }

        }
        RowLayout{AddItem{}}
    }

}
