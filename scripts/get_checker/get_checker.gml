///@descirption returns checker at x and y
///@param x grid coordinate
///@param y grid coodinate
///@return checker at x and y
function get_checker(argument0, argument1) {
	var xx = argument0
	var yy = argument1
	for (var i = 0; i < instance_number(obj_checker); i++)
	{
		if(instance_find(obj_checker,i).positionX == xx && instance_find(obj_checker,i).positionY == yy)
		{
			return instance_find(obj_checker,i);
		}
	}


}
