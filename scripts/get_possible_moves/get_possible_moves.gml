///@description find the possible moves for a piece
///@arg int positionX
///@arg int positionY
function get_possible_moves(argument0, argument1) {
	var xx = argument0;
	var yy = argument1;
	var color = ds_grid_get(Game.colorBoard, xx, yy);
	var moveSet = ds_grid_get(Game.moveSetBoard, xx, yy);
	//Find moveset
	switch(moveSet){
		case MoveSet.EMPTY:
	#region Error Zone
			//Throw Exception or something idk
			break;
	#endregion
		case MoveSet.TRADITIONAL:
	#region Traditional Moveset
			if(color == ColorState.RED)
			{
				if(test_possible_moves(xx-1, yy-1, color))
				{
					ds_grid_add(Game.moves, xx-1, yy-1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx-1, yy-1) and test_possible_moves(xx-2, yy-2, color))
				{
					ds_grid_add(Game.moves, xx-2, yy-2, true)
					//get_possible_double(xx-2,yy-2, moveSet, color);
				}
			
				if(test_possible_moves(xx+1, yy-1, color))
				{
					ds_grid_add(Game.moves, xx+1, yy-1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx+1, yy-1) and test_possible_moves(xx+2, yy-2, color))
				{
					ds_grid_add(Game.moves, xx+2, yy-2, true)
					//get_possible_double(xx+2,yy-2, moveSet, color);
				}
			} else if(color == ColorState.BLACK)
			{
				if(test_possible_moves(xx-1, yy+1, color))
				{
					ds_grid_add(Game.moves, xx-1, yy+1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx-1, yy+1) and test_possible_moves(xx-2, yy+2, color))
				{
					ds_grid_add(Game.moves, xx-2, yy+2, true)
					//get_possible_double(xx-2,yy+2, moveSet, color);
				}
			
				if(test_possible_moves(xx+1, yy+1, color))
				{
					ds_grid_add(Game.moves, xx+1, yy+1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx+1, yy+1) and test_possible_moves(xx+2, yy+2, color))
				{
					ds_grid_add(Game.moves, xx+2, yy+2, true)
					//get_possible_double(xx+2,yy+2, moveSet, color);
				}
			}
			break;
	#endregion
		case MoveSet.CHECKING:
	#region Checkers King Moveset
			//TODO
			break;
	#endregion
		case MoveSet.CHESSKING:
	#region Chess King Moveset
			if(test_possible_moves(xx, yy+1, color))
			{
				ds_grid_add(Game.moves, xx, yy+1, true)
			}
			if(test_possible_moves(xx+1, yy+1, color))
			{
				ds_grid_add(Game.moves, xx+1, yy+1, true)
			}
			if(test_possible_moves(xx+1, yy, color))
			{
				ds_grid_add(Game.moves, xx+1, yy, true)
			}
			if(test_possible_moves(xx+1, yy-1, color))
			{
				ds_grid_add(Game.moves, xx+1, yy-1, true)
			}
			if(test_possible_moves(xx, yy-1, color))
			{
				ds_grid_add(Game.moves, xx, yy-1, true)
			}
			if(test_possible_moves(xx-1, yy-1, color))
			{
				ds_grid_add(Game.moves, xx-1, yy-1, true)
			}
			if(test_possible_moves(xx-1, yy, color))
			{
				ds_grid_add(Game.moves, xx-1, yy, true)
			}
			if(test_possible_moves(xx-1, yy+1, color))
			{
				ds_grid_add(Game.moves, xx-1, yy+1, true)
			}
			break;
	#endregion
		case MoveSet.QUEEN:
	#region Queen Moveset
			var i = 1;
			while(xx + i <= 7 and xx + i >= 0 and yy + i <= 7 and yy + i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx + i, yy + i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx + i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy + i) != color) {
					ds_grid_add(Game.moves, xx + i, yy + i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			i = 1
			while(xx + i <= 7 and xx + i >= 0 and yy - i <= 7 and yy - i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx + i, yy - i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx + i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy - i) != color) {
					ds_grid_add(Game.moves, xx + i, yy - i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			i = 1
			while(xx - i <= 7 and xx - i >= 0 and yy - i <= 7 and yy - i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx - i, yy - i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx - i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy - i) != color) {
					ds_grid_add(Game.moves, xx - i, yy - i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			i = 1
			while(xx - i <= 7 and xx - i >= 0 and yy + i <= 7 and yy + i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx - i, yy + i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx - i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy + i) != color) {
					ds_grid_add(Game.moves, xx - i, yy + i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			for(var mx = xx + 1; mx < 8; mx++)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					ds_grid_add(Game.moves, mx, yy, true)
					mx += 8;
				} else {
					mx += 8;	
				}
			}
			for(var mx = xx - 1; mx > -1; mx--)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					ds_grid_add(Game.moves, mx, yy, true)
					mx -= 8;
				} else {
					mx -= 8;	
				}
			}
			for(var my = yy - 1; my > -1; my--)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					ds_grid_add(Game.moves, xx, my, true)
					my -= 8;
				} else {
					my -= 8;	
				}
			}
			for(var my = yy + 1; my < 8; my++)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					ds_grid_add(Game.moves, xx, my, true)
					my += 8;
				} else {
					my += 8;	
				}
			}
			break;
	#endregion
		case MoveSet.PAWN:
	#region Pawn Moveset
			if(color == ColorState.RED)
			{
				if(yy == 6 and ds_grid_get(Game.colorBoard, xx, yy - 2) == ColorState.EMPTY and ds_grid_get(Game.colorBoard, xx, yy - 1) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, yy - 2, true)
				}
				if(ds_grid_get(Game.colorBoard, xx, yy - 1) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, yy - 1, true)
				}
				if(ds_grid_get(Game.colorBoard, xx + 1, yy - 1) == ColorState.BLACK)
				{
					ds_grid_add(Game.moves, xx + 1, yy - 1, true)
				}
				if(ds_grid_get(Game.colorBoard, xx - 1, yy - 1) == ColorState.BLACK)
				{
					ds_grid_add(Game.moves, xx - 1, yy - 1, true)
				}
			}
			else if(color == ColorState.BLACK)
			{
				if(yy == 1 and ds_grid_get(Game.colorBoard, xx, yy + 2) == ColorState.EMPTY and ds_grid_get(Game.colorBoard, xx, yy + 1) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, yy + 2, true)
				}
				if(ds_grid_get(Game.colorBoard, xx, yy + 1) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, yy + 1, true)
				}
				if(ds_grid_get(Game.colorBoard, xx + 1, yy + 1) == ColorState.RED)
				{
					ds_grid_add(Game.moves, xx + 1, yy + 1, true)
				}
				if(ds_grid_get(Game.colorBoard, xx - 1, yy + 1) == ColorState.RED)
				{
					ds_grid_add(Game.moves, xx - 1, yy + 1, true)
				}
			}
			break;
	#endregion
		case MoveSet.BISHOP:
	#region Bishop Moveset
			var i = 1;
			while(xx + i <= 7 and xx + i >= 0 and yy + i <= 7 and yy + i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx + i, yy + i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx + i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy + i) != color) {
					ds_grid_add(Game.moves, xx + i, yy + i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			i = 1
			while(xx + i <= 7 and xx + i >= 0 and yy - i <= 7 and yy - i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx + i, yy - i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx + i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy - i) != color) {
					ds_grid_add(Game.moves, xx + i, yy - i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			i = 1
			while(xx - i <= 7 and xx - i >= 0 and yy - i <= 7 and yy - i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx - i, yy - i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx - i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy - i) != color) {
					ds_grid_add(Game.moves, xx - i, yy - i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			i = 1
			while(xx - i <= 7 and xx - i >= 0 and yy + i <= 7 and yy + i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx - i, yy + i) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx - i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy + i) != color) {
					ds_grid_add(Game.moves, xx - i, yy + i, true)
					i += 8;
				} else {
					i += 8;
				}
				i++;
			}
			break;
	#endregion
		case MoveSet.KNIGHT:
	#region Knight Moveset
			if(test_possible_moves(xx+1, yy+2, color))
			{
				ds_grid_add(Game.moves, xx+1, yy+2, true)
			}
			if(test_possible_moves(xx+2, yy+1, color))
			{
				ds_grid_add(Game.moves, xx+2, yy+1, true)
			}
			if(test_possible_moves(xx+1, yy-2, color))
			{
				ds_grid_add(Game.moves, xx+1, yy-2, true)
			}
			if(test_possible_moves(xx+2, yy-1, color))
			{
				ds_grid_add(Game.moves, xx+2, yy-1, true)
			}
			if(test_possible_moves(xx-1, yy-2, color))
			{
				ds_grid_add(Game.moves, xx-1, yy-2, true)
			}
			if(test_possible_moves(xx-1, yy+2, color))
			{
				ds_grid_add(Game.moves, xx-1, yy+2, true)
			}
			if(test_possible_moves(xx-2, yy+1, color))
			{
				ds_grid_add(Game.moves, xx-2, yy+1, true)
			}
			if(test_possible_moves(xx-2, yy-1, color))
			{
				ds_grid_add(Game.moves, xx-2, yy-1, true)
			}
			break;
	#endregion
		case MoveSet.ROOK:
	#region Rook Moveset
			for(var mx = xx + 1; mx < 8; mx++)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					ds_grid_add(Game.moves, mx, yy, true)
					mx += 8;
				} else {
					mx += 8;	
				}
			}
			for(var mx = xx - 1; mx > -1; mx--)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					ds_grid_add(Game.moves, mx, yy, true)
					mx -= 8;
				} else {
					mx -= 8;	
				}
			}
			for(var my = yy - 1; my > -1; my--)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					ds_grid_add(Game.moves, xx, my, true)
					my -= 8;
				} else {
					my -= 8;	
				}
			}
			for(var my = yy + 1; my < 8; my++)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_add(Game.moves, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					ds_grid_add(Game.moves, xx, my, true)
					my += 8;
				} else {
					my += 8;	
				}
			}
			break;
	#endregion
	}


}
