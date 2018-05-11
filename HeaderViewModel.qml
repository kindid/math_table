import QtQuick 2.0

ListModel {
    Component.onCompleted: {
        var qmod = 10
        for (var z = 0; z <= 10; z++) {
            var color = Qt.hsla((z / qmod) % 1, 0.3, 0.6, 1).toString()
            var highlight_color = Qt.hsla((z / qmod) % 1, 1, 0.9, 1).toString()
            append({
               'zz': z,
               '_color': color,
               '_highlight_color': highlight_color,
               '_state': 'normal'
            })
       }
    }
}
