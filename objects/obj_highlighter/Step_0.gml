/// @description Update position
//Initialize Variables
var xx;
var yy;
//Whose turn is it?
if(Game.turn == ColorState.RED)
{
//Test if Selected
	if(!selected and sprite_index != spr_moves)
	{
		//Test if on board
		if(!(mouse_x < 64 or mouse_x > (8*64)+64 or mouse_y < 64 or mouse_y > (8*64)+64))
		{
			//Set grid locations
			xx = (mouse_x-64) div 64;
			yy = (mouse_y-64) div 64;
			//Test if on playable checker
			if(ds_grid_get(Game.colorBoard, xx, yy) == Game.turn or ds_grid_get(Game.moves, xx, yy) == true)
			{
				x = (xx*64) + 96;
				y = (yy*64) + 96;
				sprite_index = spr_highlight;
			}
			else { sprite_index = spr_blank; }
			//Test if on a move space
			if(ds_grid_get(Game.moves, xx, yy) == true)
			{
				moving = true;	
			}
			else
			{
				moving = false;
			}
		}
		else { sprite_index = spr_blank; }
	}
}
else
{
	opponent_move();
}