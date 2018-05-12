import QtQuick 2.0

Item {
    property alias text: _text.text
    property alias color: _background.color
    property alias text_color: _text.color
    Rectangle {
        id: _background
        anchors.fill: parent
        //anchors.margins: 1
        //border.width: 1
    }
    Text {
        id: _text
        anchors.fill: parent
        anchors.rightMargin: 3
        color: '#0000ff'
        font.pixelSize: height * 0.666
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
