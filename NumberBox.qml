import QtQuick 2.0

Item {
    id: _top
    property alias text: _text.text
    property alias color: _background.color
    property alias text_color: _text.color
    property bool border_on
    Rectangle {
        id: _background
        anchors.fill: parent
        anchors.leftMargin: 1
        anchors.topMargin: 1
        // TODO:not sure
        //border.width: border_on ? 1 : 0
        Behavior on color { ColorAnimation { duration: 150 } }
    }
    Text {
        id: _text
        anchors.fill: parent
        anchors.rightMargin: 3
        //color: '#0000ff'
        //        text: '+'
        font.pixelSize: height * 0.5
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    states: [
        State {
            name: "normal"
        },
        State {
            name: "highlight"
            PropertyChanges {
                target: _top
                color: _highlight_color
            }
        }
    ]
}
