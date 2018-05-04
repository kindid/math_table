import QtQuick 2.0

Item {
    anchors.fill: parent
    property string color: '#ff0000'
//    Text {
//        text: '_x_header'
//    }
    id: container
    Row {
//    anchors.fill: parent
        Repeater {
            model: 11
            delegate: NumberBox {
//            Text {
//                width: 40
//                height: 40
                // no matter what this doesn't work - the dimensions need to be passed in
                width: container.width / 11 // doesn't work.
                height: container.width / 11   //does work
                text: index
                color: Qt.hsla((index / 8) % 1, 0.3, 0.5, 1).toString()
            }
        }
    }
}
