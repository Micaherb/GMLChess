///@description places move highlighters on all moves
function highlight_moves() {
	for(var i = 0; i < ds_grid_height(Game.moves); i++)
	{
		for(var j = 0; j < ds_grid_width(Game.moves); j++)
		{
			if(ds_grid_get(Game.moves, j, i) == true)
			{
				vMoves = instance_create_layer( (j*64) + 96, (i*64) + 96, "Instances", obj_highlighter);
				vMoves.sprite_index = spr_moves;
			}
		}
	}


}
