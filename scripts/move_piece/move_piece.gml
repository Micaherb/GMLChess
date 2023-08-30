///@description Move a checker piece ONLY WORKS WITH CHESS
///@param int xx initial value
///@param int xx final value
///@param int yy initial value
///@param int yy final value
function move_piece(argument0, argument1, argument2, argument3) {
	var xi = argument0;
	var xf = argument1;
	var yi = argument2;
	var yf = argument3;
	var color = ds_grid_get(Game.colorBoard, xi, yi);
	var moveSet = ds_grid_get(Game.moveSetBoard, xi, yi);
	var jumped = false;
	//var double = false;
	//Run possible kills
	jumped = run_possible_kills(xi, yi, xf, yf);
	//SCRIPT ONLY WORKS WITH CHESS b/c FOLLOWING LINE
	destroy_piece(xf, yf);
	//Change colorBoard
	ds_grid_set(Game.colorBoard, xf, yf, color);
	ds_grid_set(Game.colorBoard, xi, yi, ColorState.EMPTY);
	//Change moveSetBoard
	ds_grid_set(Game.moveSetBoard, xf, yf, moveSet);
	ds_grid_set(Game.moveSetBoard, xi, yi, MoveSet.EMPTY);
	//Change GUI
	instance_destroy(get_checker(xi, yi));
	checker_create_instance(xf, yf, ds_grid_get(Game.colorBoard, xf, yf), ds_grid_get(Game.moveSetBoard, xf, yf));
	//Test double jump
	if(jumped)
	{
	//double = get_possible_double(xf, yf, moveSet, color);
	}
	//Swap turn
	if(Game.turn == ColorState.RED)// and double == false)
	{
		Game.turn = ColorState.BLACK;
	} else if (Game.turn == ColorState.BLACK)// and double == false)
	{
		Game.turn = ColorState.RED;
	}


}
