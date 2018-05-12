import QtQuick 2.0

Item {
    property int x_highlight: -1
    property int y_highlight: -1
    property alias model: repeater.model
    signal enterNB(int xx, int yy)

    anchors.fill: parent

    Repeater {
        id: repeater
        delegate: NumberBox {
            id: rectangle
            // xx and yy are from the model - this is a skanky but Q&E way to grock this
            x: xx * parent.width / 11       // this will obviously break
            y: yy * parent.height / 11
            width: parent.width / 11
            height: parent.height / 11
            color: _color
            text_color: '#000000'
            text: q
            //state: (xx === y_highlight || yy === x_highlight || xx === x_highlight || yy === y_highlight) ? 'highlight' : 'normal'
            state: (xx === x_highlight || yy === y_highlight) ? 'highlight' : 'normal'

            MouseArea {
                anchors.fill: parent
            }
        }
    }
}
