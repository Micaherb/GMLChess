///@description find the dangerous opponent spaces
///@arg int positionX
///@arg int positionY
function get_danger_spaces(argument0, argument1) {
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
					ds_grid_set(Game.dangerBoard, xx-1, yy-1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx-1, yy-1) and test_possible_moves(xx-2, yy-2, color))
				{
					ds_grid_set(Game.dangerBoard, xx-2, yy-2, true)
					//get_possible_double(xx-2,yy-2, moveSet, color);
				}
			
				if(test_possible_moves(xx+1, yy-1, color))
				{
					ds_grid_set(Game.dangerBoard, xx+1, yy-1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx+1, yy-1) and test_possible_moves(xx+2, yy-2, color))
				{
					ds_grid_set(Game.dangerBoard, xx+2, yy-2, true)
					//get_possible_double(xx+2,yy-2, moveSet, color);
				}
			} else if(color == ColorState.BLACK)
			{
				if(test_possible_moves(xx-1, yy+1, color))
				{
					ds_grid_set(Game.dangerBoard, xx-1, yy+1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx-1, yy+1) and test_possible_moves(xx-2, yy+2, color))
				{
					ds_grid_set(Game.dangerBoard, xx-2, yy+2, true)
					//get_possible_double(xx-2,yy+2, moveSet, color);
				}
			
				if(test_possible_moves(xx+1, yy+1, color))
				{
					ds_grid_set(Game.dangerBoard, xx+1, yy+1, true)
				} else if(color != ds_grid_get(Game.colorBoard, xx+1, yy+1) and test_possible_moves(xx+2, yy+2, color))
				{
					ds_grid_set(Game.dangerBoard, xx+2, yy+2, true)
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
			ds_grid_set(Game.dangerBoard, xx, yy+1, true)
			ds_grid_set(Game.dangerBoard, xx+1, yy+1, true)
			ds_grid_set(Game.dangerBoard, xx+1, yy, true)
			ds_grid_set(Game.dangerBoard, xx+1, yy-1, true)
			ds_grid_set(Game.dangerBoard, xx, yy-1, true)
			ds_grid_set(Game.dangerBoard, xx-1, yy-1, true)
			ds_grid_set(Game.dangerBoard, xx-1, yy, true)
			ds_grid_set(Game.dangerBoard, xx-1, yy+1, true)
			break;
	#endregion
		case MoveSet.QUEEN:
	#region Queen Moveset
			var i = 1;
			while(xx + i <= 7 and xx + i >= 0 and yy + i <= 7 and yy + i >= 0)
			{
				if(ds_grid_get(Game.colorBoard, xx + i, yy + i) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, xx + i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy + i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx + i, yy + i, true)
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
					ds_grid_set(Game.dangerBoard, xx + i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy - i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx + i, yy - i, true)
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
					ds_grid_set(Game.dangerBoard, xx - i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy - i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx - i, yy - i, true)
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
					ds_grid_set(Game.dangerBoard, xx - i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy + i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx - i, yy + i, true)
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
					ds_grid_set(Game.dangerBoard, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, mx, yy, true)
					mx += 8;
				} else {
					mx += 8;	
				}
			}
			for(var mx = xx - 1; mx > -1; mx--)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, mx, yy, true)
					mx -= 8;
				} else {
					mx -= 8;	
				}
			}
			for(var my = yy - 1; my > -1; my--)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx, my, true)
					my -= 8;
				} else {
					my -= 8;	
				}
			}
			for(var my = yy + 1; my < 8; my++)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx, my, true)
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
				ds_grid_set(Game.dangerBoard, xx + 1, yy - 1, true)
				ds_grid_set(Game.dangerBoard, xx - 1, yy - 1, true)
			}
			else if(color == ColorState.BLACK)
			{
				ds_grid_set(Game.dangerBoard, xx + 1, yy + 1, true)
				ds_grid_set(Game.dangerBoard, xx - 1, yy + 1, true)
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
					ds_grid_set(Game.dangerBoard, xx + i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy + i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx + i, yy + i, true)
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
					ds_grid_set(Game.dangerBoard, xx + i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy - i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx + i, yy - i, true)
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
					ds_grid_set(Game.dangerBoard, xx - i, yy - i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy - i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx - i, yy - i, true)
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
					ds_grid_set(Game.dangerBoard, xx - i, yy + i, true)
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy + i) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx - i, yy + i, true)
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
			ds_grid_set(Game.dangerBoard, xx+1, yy+2, true)
			ds_grid_set(Game.dangerBoard, xx+2, yy+1, true)
			ds_grid_set(Game.dangerBoard, xx+1, yy-2, true)
			ds_grid_set(Game.dangerBoard, xx+2, yy-1, true)
			ds_grid_set(Game.dangerBoard, xx-1, yy-2, true)
			ds_grid_set(Game.dangerBoard, xx-1, yy+2, true)
			ds_grid_set(Game.dangerBoard, xx-2, yy+1, true)
			ds_grid_set(Game.dangerBoard, xx-2, yy-1, true)
			break;
	#endregion
		case MoveSet.ROOK:
	#region Rook Moveset
			for(var mx = xx + 1; mx < 8; mx++)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, mx, yy, true)
					mx += 8;
				} else {
					mx += 8;	
				}
			}
			for(var mx = xx - 1; mx > -1; mx--)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, mx, yy, true)
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, mx, yy, true)
					mx -= 8;
				} else {
					mx -= 8;	
				}
			}
			for(var my = yy - 1; my > -1; my--)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx, my, true)
					my -= 8;
				} else {
					my -= 8;	
				}
			}
			for(var my = yy + 1; my < 8; my++)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					ds_grid_set(Game.dangerBoard, xx, my, true)
				} else if(ds_grid_get(Game.colorBoard, xx, my) != ColorState.EMPTY) {
					ds_grid_set(Game.dangerBoard, xx, my, true)
					my += 8;
				} else {
					my += 8;	
				}
			}
			break;
	#endregion
	}


}
