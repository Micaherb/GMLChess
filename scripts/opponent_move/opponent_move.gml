// Do the AI thing
function opponent_move(){
	//V4: Move based on simple criteria
	//Find enemy's moves
	ds_grid_clear(Game.dangerBoard, false);
	for (var i = 0; i < instance_number(obj_checker); i++)
	{
		var inst = instance_find(obj_checker,i);
		var color = inst.color;
		var positionX = inst.positionX;
		var positionY = inst.positionY;
		if(color == ColorState.RED) {
			get_danger_spaces(positionX, positionY);
		}
	}
	//Find all possible moves
	var xxi;//init x of best piece
	var xxf;//final x of best move
	var yyi;//init y of best piece
	var yyf;//final y of best move
	var best = -1000;//score of best move
	for (var i = 0; i < instance_number(obj_checker); i++)
	{
		var inst = instance_find(obj_checker,i);
		var color = inst.color;
		var positionX = inst.positionX;
		var positionY = inst.positionY;
		if(color == ColorState.BLACK) {
			result = get_ideal_move(positionX, positionY);
			if(result[2] > best){
				best = result[2];
				xxi = positionX;
				yyi = positionY;
				xxf = result[0];
				yyf = result[1];
			}
		}
	}
	move_piece(xxi,xxf,yyi,yyf);
}