///@description find the possible moves for a piece
///@arg int positionX initial
///@arg int positionY initial
///@arg int positionX final
///@arg int positionY final
///@return true is successful false otherwise
function run_possible_kills(argument0, argument1, argument2, argument3) {
	var xi = argument0;
	var yi = argument1;
	var xf = argument2;
	var yf = argument3;
	//var color = ds_grid_get(Game.colorBoard, xi, yi);
	var moveSet = ds_grid_get(Game.moveSetBoard, xi, yi);
	//Find moveset
	switch(moveSet){
		case MoveSet.EMPTY:
	#region Error Zone
			//Throw Exception or something idk
			break;
	#endregion
		case MoveSet.TRADITIONAL:
	#region Traditional Moveset
			if(abs(xf-xi) == 2 and abs(yf-yi) == 2)
			{
				destroy_piece((xi+xf)/2, (yi+yf)/2);
				return true
			}
			return false;
			break;
	#endregion
		case MoveSet.CHECKING:
	#region King Moveset
			//TODO
			break;
	#endregion
		case MoveSet.CHESSKING || MoveSet.QUEEN || MoveSet.PAWN || MoveSet.BISHOP || MoveSet.KNIGHT || MoveSet.ROOK:
	#region Land-On Kills
			//Unessesary?
			break;
	#endregion
	}


}
