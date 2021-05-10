import QtQuick 2.0
import "gamelogic.js" as GameLogic

Item {
    id: root

    property string colorKey
    property int modelData
    property int pawnPosition: modelData
    property bool isDraggable: true

    width: 64; height: 64

    MouseArea {
        id: mouseArea

        width: 64; height: 64
        anchors.centerIn: parent

        drag.target: isDraggable ? tile : {}

        onReleased: {
            var whoseTurn = turn_label.text

            console.log("from" + pawnPosition)
            parent = GameLogic.checkIfValidMove(tile.Drag.target,pawnPosition) ? tile.Drag.target : parent
            console.log("to" + tile.Drag.target.checkerPosition)
            whoseTurn = GameLogic.checkIfValidMove(tile.Drag.target,pawnPosition) ? ((whoseTurn === "Black") ? "White" : "Black") : turn_label.text
            pawnPosition = GameLogic.checkIfValidMove(tile.Drag.target,pawnPosition) ? tile.Drag.target.checkerPosition : pawnPosition

            turn_label.text = whoseTurn
        }

        Rectangle {
            id: tile

            width: 64; height: 64
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            color: colorKey
            border.color: (colorKey == "Black") ? "White" : "Black"
            border.width: 1
            radius: width * 0.5

            Drag.keys: [ "Black" ]
            Drag.active: mouseArea.drag.active
            Drag.hotSpot.x: 32
            Drag.hotSpot.y: 32
//! [1]
            states: State {
                when: mouseArea.drag.active
                ParentChange { target: tile; parent: root }
                AnchorChanges { target: tile; anchors.verticalCenter: undefined; anchors.horizontalCenter: undefined }
            }

        }
    }
}
