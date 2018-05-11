import QtQuick 2.0

Item {
    id: container

    property string color: '#ff0000'
    property int highlighted: -1
    signal highlightChange(int xx)

    anchors.fill: parent
    // defunct. just look at how it's handled now! A thing of beauty!
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

    Row {
        anchors.fill: parent
        Repeater {
            model: _model
            delegate: NumberBox {
                // TODO: this /11 needs to reflect the table size
                width: container.width / 11
                height: container.width / 11
                text: zz
                color: _color
                state: highlighted === index ? 'highlight' : 'normal' //_state
                text_color: '#00ff00'
                // what we might want is to drag and drop
                // a number from the sum onto the table header
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
