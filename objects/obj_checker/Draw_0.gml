/// @description Draw piece
if(color == ColorState.RED){
	if(moveSet = MoveSet.TRADITIONAL){
		draw_sprite(spr_checker, 2, x, y)
	}	
	else if(moveSet = MoveSet.PAWN){
		draw_sprite(spr_checker, 11, x, y)
	}
	else if(moveSet = MoveSet.CHESSKING){
		draw_sprite(spr_checker, 10, x, y)
	}
	else if(moveSet = MoveSet.QUEEN){
		draw_sprite(spr_checker, 9, x, y)
	}
	else if(moveSet = MoveSet.BISHOP){
		draw_sprite(spr_checker, 13, x, y)
	}
	else if(moveSet = MoveSet.ROOK){
		draw_sprite(spr_checker, 12, x, y)
	}
	else if(moveSet = MoveSet.KNIGHT){
		draw_sprite(spr_checker, 14, x, y)
	}
} else if(color == ColorState.BLACK) {
	if(moveSet = MoveSet.TRADITIONAL){
		draw_sprite(spr_checker, 1, x, y)
	}
	else if(moveSet = MoveSet.PAWN){
		draw_sprite(spr_checker, 5, x, y)
	}
	else if(moveSet = MoveSet.CHESSKING){
		draw_sprite(spr_checker, 4, x, y)
	}
	else if(moveSet = MoveSet.QUEEN){
		draw_sprite(spr_checker, 3, x, y)
	}
	else if(moveSet = MoveSet.BISHOP){
		draw_sprite(spr_checker, 7, x, y)
	}
	else if(moveSet = MoveSet.ROOK){
		draw_sprite(spr_checker, 6, x, y)
	}
	else if(moveSet = MoveSet.KNIGHT){
		draw_sprite(spr_checker, 8, x, y)
	}
} else {
draw_sprite(spr_checker, 0, x, y)
}