///@description find the possible double jumps for a piece
///@arg int positionX
///@arg int positionY
///@arg MoveSet orginal moveset
///@arg ColorState orginal color
///@return true if possible otherwise false
function get_possible_double(argument0, argument1, argument2, argument3) {
	var xx = argument0;
	var yy = argument1;
	var moveSet = argument2;
	var color = argument3;
	var double = false;
	var vMoves = 0;
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
				if(ColorState.BLACK == ds_grid_get(Game.colorBoard, xx-1, yy-1) and test_possible_moves(xx-2, yy-2, color))
				{
					vMoves = instance_create_layer( xx, yy, "Instances", obj_highlighter);
					vMoves.sprite_index = spr_selected;
					ds_grid_add(Game.moves, xx-2, yy-2, true)
					ds_grid_add(Game.moves, xx, yy, true)
					highlight_moves();
					//get_possible_double(xx-2, yy-2, moveSet, color);
					double = true;
				}
				if(ColorState.BLACK == ds_grid_get(Game.colorBoard, xx+1, yy-1) and test_possible_moves(xx+2, yy-2, color))
				{
					vMoves = instance_create_layer( xx, yy, "Instances", obj_highlighter);
					vMoves.sprite_index = spr_selected;
					ds_grid_add(Game.moves, xx+2, yy-2, true)
					ds_grid_add(Game.moves, xx, yy, true)
					highlight_moves();
					//get_possible_double(xx+2, yy-2, moveSet, color);
					double = true;
				}
			} else if(color == ColorState.BLACK)
			{
				if(ColorState.RED == ds_grid_get(Game.colorBoard, xx-1, yy+1) and test_possible_moves(xx-2, yy+2, color))
				{
					vMoves = instance_create_layer( xx, yy, "Instances", obj_highlighter);
					vMoves.sprite_index = spr_selected;
					ds_grid_add(Game.moves, xx-2, yy+2, true)
					ds_grid_add(Game.moves, xx, yy, true)
					highlight_moves();
					//get_possible_double(xx-2, yy+2, moveSet, color);
					double = true;
				}
				if(ColorState.RED == ds_grid_get(Game.colorBoard, xx+1, yy+1) and test_possible_moves(xx+2, yy+2, color))
				{
					vMoves = instance_create_layer( xx, yy, "Instances", obj_highlighter);
					vMoves.sprite_index = spr_selected;
					ds_grid_add(Game.moves, xx+2, yy+2, true)
					ds_grid_add(Game.moves, xx, yy, true)
					highlight_moves();
					//get_possible_double(xx+2, yy+2, moveSet, color);
					double = true;
				}
			}
			return double;
			break;
	#endregion
		case MoveSet.CHECKING:
	#region King Moveset
			//TODO
			break;
	#endregion
	}


}
