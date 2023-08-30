 /// @description Detects when a selection is made
var xx;
var yy;
//If selecting new piece and p1's turn
if (Game.turn == ColorState.RED and sprite_index == spr_highlight and selected == false and moving == false)
{
	with (obj_highlighter) {
		if (sprite_index != spr_highlight) {
			instance_destroy();
		}
	}
	ds_grid_clear(Game.moves, false);
	xx = (x - 96)/64
	yy = (y - 96)/64
	vMoves = instance_create_layer( (xx*64) + 96, (yy*64) + 96, "Instances", obj_highlighter);
	vMoves.sprite_index = spr_selected
	vMoves.selected = true;
	get_possible_moves(xx, yy);
	highlight_moves();
}
//If selecting move
else if(moving == true)
{
	for (var i = 0; i < instance_number(obj_highlighter); i++)
    {
		if(instance_find(obj_highlighter,i).sprite_index == spr_selected)
		{
			var xxi = (instance_find(obj_highlighter,i).x - 96)/64;
			var yyi = (instance_find(obj_highlighter,i).y - 96)/64;		
		}
    }
	with (obj_highlighter) {
		if (sprite_index != spr_highlight) {
			instance_destroy();
		}
	}
	ds_grid_clear(Game.moves, false);
	moving = false;
	xx = (x - 96)/64
	yy = (y - 96)/64
	move_piece(xxi, xx, yyi, yy);
}
//This never actually gets run that I can see idk why it's here
else
{
	selected = false;
	instance_destroy(obj_highlighter);
	ds_grid_clear(Game.moves, false);
	vMoves = instance_create_layer( 0, 0, "Instances", obj_highlighter);
}