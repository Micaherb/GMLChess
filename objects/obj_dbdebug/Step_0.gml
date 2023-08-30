/// @display db on board (for debugging)
with (obj_dbdebug) {
		if (sprite_index == spr_selected) {
			instance_destroy();
		}
}
	
for(var i = 0; i < ds_grid_height(Game.dangerBoard); i++) {
	for(var j = 0; j < ds_grid_width(Game.dangerBoard); j++) {
		if(ds_grid_get(Game.dangerBoard, j, i) == true) {
			vMoves = instance_create_layer( (j*64) + 96, (i*64) + 96, "Instances", obj_dbdebug);
			vMoves.sprite_index = spr_selected;
		}
	}
}