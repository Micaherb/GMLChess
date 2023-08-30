///@description script runs imediately after each board transition to read in the checkers to the ds
function read_board() {
	for (var i = 0; i < instance_number(obj_checker); i++)
	{
		var inst = instance_find(obj_checker,i);
		var color = inst.color;
		var moveSet = inst.moveSet;
		var positionX = inst.positionX;
		var positionY = inst.positionY;
		//Put instance in board ds
		ds_grid_set(Game.colorBoard, positionX, positionY, color);
		ds_grid_set(Game.moveSetBoard, positionX, positionY, moveSet);
	}


}
