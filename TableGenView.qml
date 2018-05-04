import QtQuick 2.0

Repeater {
    model: table
    // each one of these is a number box
    delegate: NumberBox {
        id: rectangle
        // xx and yy are from the model - this is a skanky but Q&E way to grock this
        x: xx * parent.width / 11       // this will obviously break
        y: yy * parent.height / 11
        width: parent.width / 11
        height: parent.height / 11



//        border.color: '#000000'
//        border.width: 0
        // TODO:This is a QML problem. It can't disamibuate between the delegated
        // item that is called 'color' and the color property of the Rectangle.
        // 'modelData' would work EXCEPT it doesn't seem to be supported by
        // ListModel only StringList
        color: _color
        // more model data (easily fixed TBH)
        text: q // what the hell is 'q'
        Behavior on rotation { NumberAnimation { duration: 300 } }
        Behavior on color { ColorAnimation { duration: 300 } }
        //Behavior on border.width { NumberAnimation { duration: 500 } }
/*
        // It's just another numberbox man.
        Item {
            anchors.fill: parent
            anchors.margins: 2
            Text {
                anchors.fill: parent
                text: q
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: height * 0.5
            }
        }
        */
        // yeah, this is interesting and dangerous nice.
        states: [
            State {
                name: "normal"
                //                                PropertyChanges {
                //                                    target: rectangle
                //                                    rotation: 0
                //                                }
            },
            State {
                name: "highlight"
                //                                PropertyChanges {
                //                                    target: rectangle
                //                                    rotation: 10
                //                                }
                PropertyChanges {
                    target: rectangle
                    color: _highlight_color
                    //color: '#ffffff'
                }
                PropertyChanges {
                    target: rectangle
                    border.width: 1
                }
            }
        ]
        state: _state   // from model - this is either brilliant or evil - not the naming - how the hell do i get round this?
        // nasty isn't it. it's existence at this stage is only implied. we do not know what it is.
        //

        // just emit the damn thing.. *poof* off it goes.
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true  // why? LTBHIB
            onEntered: {
                table.clean_colors()
                table.highlight(idx)
                var item = table.get(idx)
                //item._color = '#ffffff'
                item._state = 'highlight'

                //                                parent.state = 'highlight'
            }
            // way cool property setters - all works thru the event loop i reckons
            onExited: {
                var item = table.get(idx)
                item._color = item._default_color
                item._state = 'normal'
            }

            onClicked: {
                var item = table.get(idx)
                console.log(JSON.stringify(item))
                // you don't need to change the colour of the cell, just update
                // an overlay (for now)
                item._color = '#ffffff'
                //                                table.setProperty(idx, '_color', Qt.rgba(1,1,1,1))
                //)(idx)._color = Qt.rgba(1,1,1,1)
            }
        }
    }
}
