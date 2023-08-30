///@description Destroy a piece
///@param int xx value
///@param int yy value
function destroy_piece(argument0, argument1) {
	var xx = argument0;
	var yy = argument1;
	//Change colorBoard
	ds_grid_set(Game.colorBoard, xx, yy, ColorState.EMPTY);
	//Change moveSetBoard
	ds_grid_set(Game.moveSetBoard, xx, yy, MoveSet.EMPTY);
	//Change GUI
	for (var i = 0; i < instance_number(obj_checker); i++)
	{
		if(instance_find(obj_checker,i).positionX == xx && instance_find(obj_checker,i).positionY == yy)
		{
			instance_destroy(instance_find(obj_checker,i));
		}
	}


}
