import QtQuick 2.0

Item {
    id: container
    property int highlighted: -1
    signal highlightChange(int yy)

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

    Column {
        Repeater {
            model: _model
            delegate: NumberBox {
                width: container.height / 11 // doesn't work.
                height: container.height / 11   //does work
                text: index
//                color: Qt.hsla((index / 8) % 1, 0.3, 0.5, 1).toString()
                color: _color
                text_color: '#0000ff'
                state: highlighted === index ? 'highlight' : 'normal' //_state
                //state: _state
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        highlighted = index;
                        highlightChange(index)
    //                        console.log("blah " + index)
                    }
                }
            }
        }
    }
}
