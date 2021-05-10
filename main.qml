import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 2.12

import "gamelogic.js" as GameLogic

Window {
    id: root
    width: 720
    height: 720


    visible: true
    title: qsTr("Checkers")

    property bool isGamePlayed: false

    GridLayout {
    //buttons and info panel
        id: mainLayout
        anchors.fill: parent
        rows: 2

        Rectangle {
            Layout.row: 0
            Layout.fillWidth: true
            Layout.minimumHeight: root.height * 0.15

            width: root.width
            height: 0.1 * root.height

            anchors.top: root.top
            color: "light grey"

            RowLayout {
                anchors.fill: parent

                Button {
                    id: start_button

                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    text: "Start"

                    onClicked: GameLogic.startNew()
                }

                Button {
                    id: stop_button

                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    text: "Stop"

                    onClicked: GameLogic.stopGame()
                }

                Button {
                    id: optionsButton
                    text: "Options"

                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20

                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    onClicked: {
                        GameLogic.stopGame()
                        optionsDialog.open()
                    }
                }

                Label {
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Turn:"
                }

                Label {
                    id: turn_label
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Black"
                }
            }
        }

        //checker board placeholder
        GridLayout {
            id: checker_board_background
            Layout.row: 1
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            columnSpacing: 0
            rowSpacing: 0

            width: 64*8
            height: 64*8
            columns: 8
            rows: 8

            Repeater {
                model: 64;
                delegate: DropTile {
                    colorKey: GameLogic.checkerBoardColor(index);
                    checkerPosition: index;
                    Layout.fillHeight: true;
                    Layout.fillWidth: true }
            }

        }

        GridLayout {
            id: pawns
            Layout.row: 1
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            columnSpacing: 0
            rowSpacing: 0

            width: 64*8
            height: 64*8
            columns: 8
            rows: 8

            // first row
            DragTile {
                colorKey: "White";
                pawnPosition: 0;
                Layout.fillWidth: true;
                Layout.fillHeight:  true;
                Layout.row: 0;
                Layout.column: 0;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 0;
                Layout.column: 1;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 2;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 0;
                Layout.column: 2;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 0;
                Layout.column: 3;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 4;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 0;
                Layout.column: 4;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 0;
                Layout.column: 5;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 6;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 0;
                Layout.column: 6;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 0;
                Layout.column: 7;
            }

            //second row:

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 1;
                Layout.column: 0;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 9;
                Layout.fillWidth: true;
                Layout.fillHeight:  true;
                Layout.row: 1;
                Layout.column: 1;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 1;
                Layout.column: 2;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 11;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 1;
                Layout.column: 3;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 1;
                Layout.column: 4;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 13;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 1;
                Layout.column: 5;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 1;
                Layout.column: 6;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 15;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 1;
                Layout.column: 7;
            }

            //third row:

            DragTile {
                colorKey: "White";
                pawnPosition: 16;
                Layout.fillWidth: true;
                Layout.fillHeight:  true;
                Layout.row: 2;
                Layout.column: 0;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 2;
                Layout.column: 1;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 18;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 2;
                Layout.column: 2;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 2;
                Layout.column: 3;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 20;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 2;
                Layout.column: 4;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 2;
                Layout.column: 5;
            }

            DragTile {
                colorKey: "White";
                pawnPosition: 22;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 2;
                Layout.column: 6;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 2;
                Layout.column: 7;
            }
            Repeater {
                model: 16;
                delegate: Rectangle{
                    color: "transparent"
                    width: 80
                    height: 80
                }
            }

//            Repeater {
//                model: 24;
//                delegate: DragTile {
//                    colorKey: "Black"
//                    pawnPosition: index
//                    Layout.fillWidth: true
//                    Layout.fillHeight:  true }
//            }


           //sixth row

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 5;
                Layout.column: 0;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 41;
                Layout.fillWidth: true;
                Layout.fillHeight:  true;
                Layout.row: 5;
                Layout.column: 1;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 5;
                Layout.column: 2;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 43;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 5;
                Layout.column: 3;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 5;
                Layout.column: 4;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 45;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 5;
                Layout.column: 5;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 5;
                Layout.column: 6;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 47;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 5;
                Layout.column: 7;
            }

           //seventh row

            DragTile {
                colorKey: "Black";
                pawnPosition: 48;
                Layout.fillWidth: true;
                Layout.fillHeight:  true;
                Layout.row: 6;
                Layout.column: 0;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 6;
                Layout.column: 1;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 50;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 6;
                Layout.column: 2;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 6;
                Layout.column: 3;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 52;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 6;
                Layout.column: 4;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 6;
                Layout.column: 5;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 54;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 6;
                Layout.column: 6;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 6;
                Layout.column: 7;
            }

           //eigth row

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 7;
                Layout.column: 0;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 57;
                Layout.fillWidth: true;
                Layout.fillHeight:  true;
                Layout.row: 7;
                Layout.column: 1;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 7;
                Layout.column: 2;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 59;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 7;
                Layout.column: 3;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 7;
                Layout.column: 4;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 61;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 7;
                Layout.column: 5;
            }

            Rectangle{
                color: "transparent"
                width: 64
                height: 64
                Layout.row: 7;
                Layout.column: 6;
            }

            DragTile {
                colorKey: "Black";
                pawnPosition: 63;
                Layout.fillWidth: true;
                Layout.fillHeight:  true
                Layout.row: 7;
                Layout.column: 7;
            }
        }

        Rectangle{
            id: game_rect
            Layout.row: 1
            color: "gray"
            visible: true
            opacity: 0.7
            Layout.fillWidth: true;
            Layout.fillHeight:  true
        }

    }


    //game over dialog
    Dialog {
        id: gameOverDialog
        modal: true
        title: "Game Over!"
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        ColumnLayout {
            width: parent.width

            Label {
                text: "Game Over..."
                horizontalAlignment: Label.AlignHCenter
                Layout.fillWidth: true
            }
        }
    }


    //settings window
    Dialog {
        id: optionsDialog
        modal: true
        title: "Options"
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        ColumnLayout {
            width: parent.width

            //turn settings
            Label {
                text: "Player who starts the game:"
                Layout.fillWidth: true
            }

            ComboBox {
                id: settingTurn
                model: ["Black", "White"]
                currentIndex: 0
                Layout.fillWidth: true
            }

            DialogButtonBox {
                standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel

                onAccepted: {
                    turn_label.text = settingTurn.currentValue
                    optionsDialog.close()
                }
                onRejected: optionsDialog.close()
            }
        }
    }

}

