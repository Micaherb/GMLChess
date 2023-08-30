 /// @description Run at start of game
randomize();
room_goto_next();
//Define Enums
enum MoveSet {EMPTY, TRADITIONAL, CHECKING, TELEPORT, JUMP_ON, STRAIT, CHESSKING, BISHOP, KNIGHT, ROOK, QUEEN, PAWN};
enum ColorState {EMPTY, RED, BLACK};
//Other constants
global.PIECE_VALUES = [0,0,0,0,0,0,500,3,3,5,9,2];
//Define data structures
colorBoard = ds_grid_create(9, 9);
moveSetBoard = ds_grid_create(9, 9);
dangerBoard = ds_grid_create(9, 9);
moves = ds_grid_create(9,9);
ds_grid_clear(moves, false);
//Define global variables
turn = ColorState.RED