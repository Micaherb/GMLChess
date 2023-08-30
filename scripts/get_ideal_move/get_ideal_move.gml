///@description find the best move for a piece
///@arg int positionX
///@arg int positionY
// @return [movex, movey, best]
function get_ideal_move(argument0, argument1) {
	var xx = argument0;
	var yy = argument1;
	var best = -1000;
	var movex = -1;
	var movey = -1;
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
				var temp = get_move_value(xx,xx,yy,yy+1)
				if(temp > best){
					best = temp;
					movex = xx
					movey = yy+1
				}
			}
			if(test_possible_moves(xx+1, yy+1, color))
			{
				var temp = get_move_value(xx,xx+1,yy,yy+1)
				if(temp > best){
					best = temp;
					movex = xx+1
					movey = yy+1
				}
			}
			if(test_possible_moves(xx+1, yy, color))
			{
				var temp = get_move_value(xx,xx+1,yy,yy)
				if(temp > best){
					best = temp;
					movex = xx+1
					movey = yy
				}
			}
			if(test_possible_moves(xx+1, yy-1, color))
			{
				var temp = get_move_value(xx,xx+1,yy,yy-1)
				if(temp > best){
					best = temp;
					movex = xx+1
					movey = yy-1
				}
			}
			if(test_possible_moves(xx, yy-1, color))
			{
				var temp = get_move_value(xx,xx,yy,yy-1)
				if(temp > best){
					best = temp;
					movex = xx
					movey = yy-1
				}
			}
			if(test_possible_moves(xx-1, yy-1, color))
			{
				var temp = get_move_value(xx,xx-1,yy,yy-1)
				if(temp > best){
					best = temp;
					movex = xx-1
					movey = yy-1
				}
			}
			if(test_possible_moves(xx-1, yy, color))
			{
				var temp = get_move_value(xx,xx-1,yy,yy)
				if(temp > best){
					best = temp;
					movex = xx-1
					movey = yy
				}
			}
			if(test_possible_moves(xx-1, yy+1, color))
			{
				var temp = get_move_value(xx,xx-1,yy,yy+1)
				if(temp > best){
					best = temp;
					movex = xx-1
					movey = yy+1
				}
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
					var temp = get_move_value(xx,xx+i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy+i
					}
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy + i) != color) {
					var temp = get_move_value(xx,xx+i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy+i
					}
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
					var temp = get_move_value(xx,xx+i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy-i
					}
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy - i) != color) {
					var temp = get_move_value(xx,xx+i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy-i
					}
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
					var temp = get_move_value(xx,xx-i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy-i
					}
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy - i) != color) {
					var temp = get_move_value(xx,xx-i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy-i
					}
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
					var temp = get_move_value(xx,xx-i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy+i
					}
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy + i) != color) {
					var temp = get_move_value(xx,xx-i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy+i
					}
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
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
					mx += 8;
				} else {
					mx += 8;	
				}
			}
			for(var mx = xx - 1; mx > -1; mx--)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
					mx -= 8;
				} else {
					mx -= 8;	
				}
			}
			for(var my = yy - 1; my > -1; my--)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
					my -= 8;
				} else {
					my -= 8;	
				}
			}
			for(var my = yy + 1; my < 8; my++)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
					my += 8;
				} else {
					my += 8;	
				}
			}
			break;
	#endregion
		case MoveSet.PAWN:
	#region Pawn Moveset
			if(color == ColorState.BLACK)
			{
				if(yy == 1 and ds_grid_get(Game.colorBoard, xx, yy + 2) == ColorState.EMPTY and ds_grid_get(Game.colorBoard, xx, yy + 1) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,xx,yy,yy+2)
					if(temp > best){
						best = temp;
						movex = xx
						movey = yy+2
					}
				}
				if(ds_grid_get(Game.colorBoard, xx, yy + 1) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,xx,yy,yy+1)
					if(temp > best){
						best = temp;
						movex = xx
						movey = yy+1
					}
				}
				if(ds_grid_get(Game.colorBoard, xx + 1, yy + 1) == ColorState.RED)
				{
					var temp = get_move_value(xx,xx+1,yy,yy+1)
					if(temp > best){
						best = temp;
						movex = xx+1
						movey = yy+1
					}
				}
				if(ds_grid_get(Game.colorBoard, xx - 1, yy + 1) == ColorState.RED)
				{
					var temp = get_move_value(xx,xx-1,yy,yy+1)
					if(temp > best){
						best = temp;
						movex = xx-1
						movey = yy+1
					}
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
					var temp = get_move_value(xx,xx+i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy+i
					}
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy + i) != color) {
					var temp = get_move_value(xx,xx+i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy+i
					}
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
					var temp = get_move_value(xx,xx+i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy-i
					}
				} else if(ds_grid_get(Game.colorBoard, xx + i, yy - i) != color) {
					var temp = get_move_value(xx,xx+i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx+i
						movey = yy-i
					}
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
					var temp = get_move_value(xx,xx-i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy-i
					}
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy - i) != color) {
					var temp = get_move_value(xx,xx-i,yy,yy-i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy-i
					}
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
					var temp = get_move_value(xx,xx-i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy+i
					}
				} else if(ds_grid_get(Game.colorBoard, xx - i, yy + i) != color) {
					var temp = get_move_value(xx,xx-i,yy,yy+i)
					if(temp > best){
						best = temp;
						movex = xx-i
						movey = yy+i
					}
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
				var temp = get_move_value(xx,xx+1,yy,yy+2)
				if(temp > best){
					best = temp;
					movex = xx+1
					movey = yy+2
				}
			}
			if(test_possible_moves(xx+2, yy+1, color))
			{
				var temp = get_move_value(xx,xx+2,yy,yy+1)
				if(temp > best){
					best = temp;
					movex = xx+2
					movey = yy+1
				}
			}
			if(test_possible_moves(xx+1, yy-2, color))
			{
				var temp = get_move_value(xx,xx+1,yy,yy-2)
				if(temp > best){
					best = temp;
					movex = xx+1
					movey = yy-2
				}
			}
			if(test_possible_moves(xx+2, yy-1, color))
			{
				var temp = get_move_value(xx,xx+2,yy,yy-1)
				if(temp > best){
					best = temp;
					movex = xx+2
					movey = yy-1
				}
			}
			if(test_possible_moves(xx-1, yy-2, color))
			{
				var temp = get_move_value(xx,xx-1,yy,yy-2)
				if(temp > best){
					best = temp;
					movex = xx-1
					movey = yy-2
				}
			}
			if(test_possible_moves(xx-1, yy+2, color))
			{
				var temp = get_move_value(xx,xx-1,yy,yy+2)
				if(temp > best){
					best = temp;
					movex = xx-1
					movey = yy+2
				}
			}
			if(test_possible_moves(xx-2, yy+1, color))
			{
				var temp = get_move_value(xx,xx-2,yy,yy+1)
				if(temp > best){
					best = temp;
					movex = xx-2
					movey = yy+1
				}
			}
			if(test_possible_moves(xx-2, yy-1, color))
			{
				var temp = get_move_value(xx,xx-2,yy,yy-1)
				if(temp > best){
					best = temp;
					movex = xx-2
					movey = yy-1
				}
			}
			break;
	#endregion
		case MoveSet.ROOK:
	#region Rook Moveset
			for(var mx = xx + 1; mx < 8; mx++)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
					mx += 8;
				} else {
					mx += 8;	
				}
			}
			for(var mx = xx - 1; mx > -1; mx--)
			{
				if(ds_grid_get(Game.colorBoard, mx, yy) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
				} else if(ds_grid_get(Game.colorBoard, mx, yy) != color) {
					var temp = get_move_value(xx,mx,yy,yy)
					if(temp > best){
						best = temp;
						movex = mx
						movey = yy
					}
					mx -= 8;
				} else {
					mx -= 8;	
				}
			}
			for(var my = yy - 1; my > -1; my--)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
					my -= 8;
				} else {
					my -= 8;	
				}
			}
			for(var my = yy + 1; my < 8; my++)
			{
				if(ds_grid_get(Game.colorBoard, xx, my) == ColorState.EMPTY)
				{
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
				} else if(ds_grid_get(Game.colorBoard, xx, my) != color) {
					var temp = get_move_value(xx,xx,yy,my)
					if(temp > best){
						best = temp;
						movex = xx
						movey = my
					}
					my += 8;
				} else {
					my += 8;	
				}
			}
			break;
	#endregion
	}
	result = [movex, movey, best];
	return result;
}
