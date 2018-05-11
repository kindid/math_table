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

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: 'qrc:/images/blackboard.jpg'
    }

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
        color: 'transparent'
//        color: Qt.hsla(1,1,1,1)//'#ddddff'

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

                // test;this is just a test
                // note;hmm. only 2 of these - one for col and one for row
                // possibly cool intersection
                //  maybe even particles
                Rectangle {
                    id: col_highlight
                    x: (parent.width / 12) * 4
                    y: 0
                    width: (parent.width / 12)
                    height: parent.height
                    color: '#000'
                }

                Rectangle {
                    id: row_highlight
                    x: 0
                    y: (parent.height / 12) * 7
                    width: parent.width
                    height: parent.height / 12
                    color: '#000'
                }

                // expose this - you'll want to set the text AND it has some
                // very pleasant side effects if clicked.
                OpView {      // todo; _op = Item { }// please.
                    id: _op
                    anchors.fill: parent
                    anchors.rightMargin: parent.width - (parent.width / 12)
                    anchors.bottomMargin: parent.height - (parent.height / 12)
                    text: '+'
                    color: '#ff8080'
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
/*
                Rectangle {
                    id: _x_header
                    anchors.fill: parent
                    anchors.leftMargin: (parent.width / 12)
                    anchors.bottomMargin: parent.height - (parent.height / 12)
                    color: "#ff8080"
                    border.width: 1
                }
*/
                // the aspect ratio of this box needs to be 1:12 (numbers 0 to 10)
                // there are actually 12 divisions... 12 along the X header and a
                // 12 which is op and yheader
                XHeaderView {
                    id: _x_header
                    anchors.fill: parent
                    anchors.leftMargin: (parent.width / 12)
                    anchors.bottomMargin: parent.height - (parent.height / 12)

                    // can I have a reverse binding here?
                    // that is I want to bind from
                    onHighlightChange: {
                        number_table.x_highlight = xx
                        //console.log(xx)
                    }

                    // can I use inline property aliases?
                    // so divvy this up - you need to draw a number line¢
                    // screen space always matches up - don't panic!

                    // move but experimenting
                }

                YHeaderView {
                    id: _y_header
                    anchors.fill: parent
                    anchors.rightMargin: parent.width - (parent.width / 12)
                    anchors.topMargin: (parent.height / 12)
                    onHighlightChange: {
                        number_table.y_highlight = yy
                        //console.log(xx)
                    }
                }

                // this is just a test
                Rectangle {
                    color:'#ffffff'     // fix - make type safe (everything should be type safe! dynamic properties have either a default value or 'optional')
                    x: 0
                    y: parent.height / 12
                    width: parent.width
                    height: 1
                }

                Rectangle {
                    color:'#ffffff'     // fix - make type safe (everything should be type safe! dynamic properties have either a default value or 'optional')
                    x: parent.width / 12
                    y: 0
                    width: 1
                    height: parent.height
                }

                Rectangle {
                    color:'#ffffff'     // fix - make type safe (everything should be type safe! dynamic properties have either a default value or 'optional')
                    x: 0
                    y: 0
                    width: parent.width
                    height: 1
                }

                Rectangle {
                    color:'#ffffff'     // fix - make type safe (everything should be type safe! dynamic properties have either a default value or 'optional')
                    x: 0
                    y: 0
                    width: 1
                    height: parent.height
                }

                Item {
                    anchors.fill: parent
                    anchors.leftMargin: (parent.width / 12)
                    anchors.topMargin: (parent.height / 12)
                    TableGenView {
                        id: number_table
                        model: table
                        onEnterNB: {
                            // this tells you which column and row BUT
                            // how do I affect just the element i wanted changed?
                            //console.log(xx, yy);
                            //_x_header.highlight(xx)
                            //_x_header.highlighted = xx
                            _y_header.highlight(yy)
                        }
                    }
                }
/*
                Image {
                    id: circled_number
                    x: 3 * (parent.width / 12) - 5
                    y: 3 * (parent.height / 12) - 5
                    width: (parent.width / 12) + 10
                    height: (parent.height / 12) + 10
                    source: 'qrc:/images/circle.png'
                }
*/
                // this is the table model. just alias the model over.
            }
        }
    }
}
