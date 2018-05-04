import QtQuick 2.0

Item {
    id: container
    Column {
        Repeater {
            model: 11
            delegate: NumberBox {
                width: container.height / 11 // doesn't work.
                height: container.height / 11   //does work
                text: index
                color: Qt.hsla((index / 8) % 1, 0.3, 0.5, 1).toString()
            }
        }
    }
}
