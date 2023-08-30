 /// @description Check for click and send to level
//Mouse check
if(mouse_check_button_pressed(mb_left) and mouse_x < x + 16 and mouse_x > x - 16 and mouse_y < y + 16 and mouse_y > y - 16)
{
	//switch to correct level
	switch(level)
	{
		case -1:
		#region Error Zone
			//Throw Exception or something idk
			break;
		#endregion
		case 1:
		#region Basic checkers game
			room_goto(rm_board2);
			break;
		#endregion
		case 2:
		#region Basic checkers game
			room_goto(rm_board3);
			break;
		#endregion
	}
instance_destroy();
}
