// Script assets have changed for v2.3.0 see
// @arg positionxi
// @arg positionxf
// @arg positionyi
// @arg positionyf
function  get_move_value(xi, xf, yi, yf){
	var myVal = global.PIECE_VALUES[ds_grid_get(Game.moveSetBoard, xi, yi)];
	var oppVal = global.PIECE_VALUES[ds_grid_get(Game.moveSetBoard, xf, yf)];
	var total = 0;
	//Add attack value to total
	total += oppVal;
	//Subtract own value if moving to danger space
	if(ds_grid_get(Game.dangerBoard, xf, yf)) {
		total -= myVal
	}
	//Add own value if moving from danger space
	if(ds_grid_get(Game.dangerBoard, xi, yi)) {
		total += myVal
	}
	//Prioritize moves toward center
	var distance = sqrt((sqr(3.5-xf))+(sqr(3.5-yf)))
	total += 1/distance
	//return total
	return total;
}