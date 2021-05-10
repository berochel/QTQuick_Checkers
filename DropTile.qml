import QtQuick 2.0

DropArea {
    id: dragTarget

    property string colorKey
    property alias dropProxy: dragTarget
    property int checkerPosition: 0

    width: 64; height: 64
    keys: ["Black","White","Red"]

    Rectangle {
        id: dropRectangle

        anchors.fill: parent
        color: dragTarget.colorKey

        states: [
            State {
                when: dragTarget.containsDrag
                PropertyChanges {
                    target: dropRectangle
                    color: "grey"
                }
            }
        ]
    }
}
