import QtQuick 2.0

ListModel {
    // add properties for rows/columns
//    id: table
    signal ready()
    function highlight(index) {
        //console.log("boo " + index)
        var item = get(index)
        var xx = item.xx
        var yy = item.yy
        for (var x = 0; x <= xx; x++) {
            // move left
            // should be state change i guess. set this up at init time
            get(index - x)._state = 'highlight'
            //get(index - x)._color = get(index - x)._highlight_color//'#0000ff';
        }
        for (var y = 0; y <= yy; y++) {
            // move up
            get(index - (y * 11))._state = 'highlight'
            //get(index - (y * 11))._color = '#0000ff';
        }
    }
    // not good enough. is there any array model? (without going to C++)
    function clean_colors() {
        for (var y = 0; y <= 10; y++) {
            for (var x = 0; x <= 10; x++) {
                get(x + y * 11)._state = 'normal'
                //get(x + y * 11)._color = get(x + y * 11)._default_color;
            }
        }
    }

    Component.onCompleted: {
        var counter = 0;
        var qmod = 10
        // need header row too. doesn't expand out the same way
        // example -
        // sub-delegate typing is really tedious. WHY?
        //  this type needs a different mouse handler (unless we get REALLY mathematical)
        for (var y = 0; y <= 10; y++) {
            for (var x = 0; x <= 10; x++) {
                var q = x + y
                // this toString **** is rubbish too. This is what happens when you don't
                // have proper types! what if we want different interpolation? argh!
                //var color = Qt.hsla((q / 8) % 1, 0.5, 0.7, 1).toString()
                var color = Qt.hsla((q / qmod) % 1, 0.3, 0.5, 1).toString()
                var highlight_color = Qt.hsla((q / qmod) % 1, 1, 0.9, 1).toString()
                // object notation sucks... frankly it should look like code anyway (that's what it is)
                // it's a function that returns an object and assignments within it are assignments to
                // properties of the returned object. kill that syntax
                append({
                           'idx': counter,
                           'xx': x,
                           'yy': y,
                           'q': q,
                           // this _ **** is due to ambiguity in delegates - frankly. it sucks quite a lot
                           // and is the single biggest annoyance so far (streets ahead of the onComplete rubbish)
                           '_color': color,
                           '_default_color': color,
                           '_highlight_color': highlight_color,
                           '_state': 'normal'


                           //                        '_color': Qt.hsla((Math.sin(q / 1) + 1) * 0.5, 1, 0.8, 1).toString()  //1.0, 1, 0.5, 1)
                           //                        '_color': Qt.rgba((q % 4) / 3, q % ,0,1)
                       });
                counter++
                // FAR TOO WORDY
                //console.log(Qt.hsla(q / 20,1,0.5,1).toString())
                //'#ffff00' })
            }
        }
    }
}
