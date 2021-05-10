function startNew() {
    if(!isGamePlayed) {
        isGamePlayed = true
        game_rect.visible = false
    }
    else
        changeTurn()
}

function stopGame() {
    if(isGamePlayed){
      game_rect.visible = true
      isGamePlayed = false
      gameOverDialog.open()
    }
}
function changeTurn() {
    if(turn_label.text === "White")
        turn_label.text = "Black"
    else
        turn_label.text = "White"
}
function isInOtherRow(index) {
    var number = index|0

    return number%2 == 0
}
function ifInValidPlace(index)
{
    return ((index%2 == 0 && isInOtherRow(index/8)) || (index%2 == 1 && !isInOtherRow(index/8)))
}
function checkerBoardColor(index) {
    return ifInValidPlace(index) ? "black" : "white"
}
function setPawnColor(index) {
    console.log((index))
    if (!ifInValidPlace && (index/8) <= 3)
    {
        return "black"
    }
    else if (!ifInValidPlace && (index/8) >= 6)
    {
        return "white"
    }
    else
        return "transparent"
}
function checkIfValidMove(target,pawnPosition)
{
    return (target !== null && (target.checkerPosition - pawnPosition == 7 || target.checkerPosition - pawnPosition == -7 || target.checkerPosition - pawnPosition == 9 || target.checkerPosition - pawnPosition == -9) && turn_label.text === colorKey)
}
