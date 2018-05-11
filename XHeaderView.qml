import QtQuick 2.0

Item {
    id: container
    anchors.fill: parent
    property string color: '#ff0000'

    function highlight(x) {
        // god damn - I wrote 'state' not '_state' this really needs fixing up
        for (var i = 0; i <= 10; i++) {
            _model.get(i)._state = 'normal'
        }
        _model.get(x)._state = 'highlight'
    }

    HeaderViewModel {
        id: _model
    }

    //    Text {
    //        text: '_x_header'
    //    }
    // one of these needs to be highlighted.
    Row {
        anchors.fill: parent
        Repeater {
            model: _model
            delegate: NumberBox {
                //border_on: true
                //            Text {
                //                width: 40
                //                height: 40
                // no matter what this doesn't work - the dimensions need to be passed in
                width: container.width / 11 // doesn't work.
                height: container.width / 11   //does work
                text: zz
                color: _color
                state: _state
                // set state i guess....
//                color: Qt.hsla((index / 8) % 1, 0.3, 0.5, 1).toString()
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("blah " + index)
                    }
                }
            }
        }
    }
}
