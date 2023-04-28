import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import Lists 1.0
Item{

    ///------------------Lista so site listi kje sedi tuka ---------------///
   Text {
       text:"MY LISTS"
       color: "lightgray"
       anchors.bottom: grayline.top


    }
    Rectangle {
        id:grayline
        width: parent.width-20
        height: 1
        color: "lightgrey"

    }
   Lists{}
}
