import QtQuick 2.10
import QtQuick.Window 2.10

// import horizontal sum

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string x_color: Qt.hsla(0.3, 0.7, 0.5, 1).toString()
    property string y_color: Qt.hsla(0.7, 1, 0.5, 1).toString()
    property string x_number
    property string y_number
    // what else you got?

    // just import this surely. DONE
    NumberTableModel {
        id: table
    }

    Rectangle {
        id: header
        anchors.fill: parent
        anchors.bottomMargin: parent.height - 30
        color: '#ddffdd'
        // yeah, you want this centered don't you.
        SumHorizontal {
            text_a: 'X'
            color_a: x_color    // Qt.hsla(0.3, 0.7, 0.5, 1).toString() //'#ffff00'
            text_op: '+'
            text_b: 'Y'
            color_b: y_color    // Qt.hsla(0.7, 1, 0.5, 1).toString() //'#ffff00'
        }
    }

    // can i define a component here?
    Component {
        id: standardText
        Text {
            anchors.fill: parent
            color: '#0000ff'
            text: 'bomb!'
        }
    }

    Rectangle {
        id: content
        anchors.fill: parent
        anchors.topMargin: 30
        color: Qt.hsla(1,1,1,1)//'#ddddff'

        Item {
            anchors.fill: parent
            anchors.margins: 10

            // put the whole thing in one of those
            // the children are Op, XHeader, YHeader and XYTable
            // eventually we need to generate the "infinite flick view". ouch

            Item {
                width: Math.min(parent.width, parent.height)
                height: Math.min(parent.width, parent.height)
                x: (parent.width - Math.min(parent.width, parent.height)) / 2
                y: (parent.height - Math.min(parent.width, parent.height)) / 2

                // expose this - you'll want to set the text AND it has some
                // very pleasant side effects if clicked.
                OpView {      // todo; _op = Item { }// please.
                    id: _op
                    anchors.fill: parent
                    anchors.rightMargin: parent.width - (parent.width / 11)
                    anchors.bottomMargin: parent.height - (parent.height / 11)
                    // can I use inline property aliases?
                    // fine, how do i set properties. like text.
                    //Loader { sourceComponent: standardText }
                    // still horse****. try again



//                    Text {
//                        text: '_op'
//                    }
                }

                // if you click 'op' you'll switch to 3D screen space
                // this is the 'warp' or 'secret' key. i won't tell
                // anyone about this or put it on any advertising.
                // only those that have played the game will know
                // this is here. that includes reviewers.

                XHeaderView {
                    id: _x_header
                    anchors.fill: parent
                    anchors.leftMargin: (parent.width / 11)
                    anchors.bottomMargin: parent.height - (parent.height / 100)

                    // can I use inline property aliases?
                    // so divvy this up - you need to draw a number line¢
                    // screen space always matches up - don't panic!

                    // move but experimenting
                }

                YHeaderView {
                    id: _y_header
                    anchors.fill: parent
                    anchors.rightMargin: parent.width - (parent.width / 11)
                    anchors.topMargin: (parent.height / 11)
                }

                Item {
                    anchors.fill: parent
                    anchors.leftMargin: (parent.width / 11)
                    anchors.topMargin: (parent.height / 11)
                    TableGenView { }
                }

                // this is the table model. just alias the model over.
            }
        }
    }
}
