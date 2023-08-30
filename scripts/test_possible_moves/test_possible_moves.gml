///@description find if legal moves are possible ONLY FUNCTIONAL FOR CHESS CURRENTLY
///@arg int positionX
///@arg int positionY
///@arg ColoarState color
///@return boolean true or false
function test_possible_moves(argument0, argument1, argument2) {
	var xx = argument0
	var yy = argument1
	var color = argument2
	if(xx <= 7 and xx >= 0 and yy <= 7 and yy >= 0 and ds_grid_get(Game.colorBoard, xx, yy) != color)
	{
		return true;
	}
	else
	{
		return false;	
	}


}
