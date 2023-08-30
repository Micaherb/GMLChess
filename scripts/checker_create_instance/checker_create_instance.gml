///@description lay out all pieces on the board
///@arg int positionX
///@arg int positionY
///@arg ColorState color
///@arg MoveSet move set of the piece
function checker_create_instance(argument0, argument1, argument2, argument3) {

	//Initializa Variables
	var positionX = argument0;
	var positionY = argument1;
	var color = argument2;
	var moveSet = argument3;

	//Construct instance
	vChecker=instance_create_layer( (positionX*64) + 96, (positionY*64) + 96, "Instances", obj_checker);
	vChecker.positionX= positionX;
	vChecker.positionY= positionY;
	vChecker.moveSet= moveSet;
	vChecker.color= color;

	//Put instance in board ds
	ds_grid_set(Game.colorBoard, positionX, positionY, color);
	ds_grid_set(Game.moveSetBoard, positionX, positionY, moveSet);


}
