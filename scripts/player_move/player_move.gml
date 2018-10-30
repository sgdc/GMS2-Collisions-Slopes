var bbox_side = (velocity[0] > 0) ? bbox_right : bbox_left;
var side_top = [bbox_side, bbox_top];
var side_bottom = [bbox_side, bbox_bottom];
var side_middle = [bbox_side, y];

onSlope = (collision_point(x, bbox_bottom + 1, obj_slope, true, true));

for (var i = 0; i < abs(velocity[0]); i++) {
  x += sign(velocity[0]);
  
  if (collision_point(x, bbox_bottom, obj_slope, true, true)) {
    y -= 1;
    onSlope = true;
  } 
  
  if (onSlope) {
    var points = [side_top, side_middle];
    
    for (var j = 0; j < array_length_1d(points); j++) {
      var point = points[j];
      var col_x = point[0];
      var col_y = point[1];
      
      if (collision_point(col_x, col_y, obj_wall, true, true)) {
        x -= sign(velocity[0]);
        break;
      }
    }
  } else if (place_meeting(x, y, obj_wall)) {
    x -= sign(velocity[0]);
    break;
  }
}

for (var i = 0; i < abs(velocity[1]); i++) {
  y += sign(velocity[1]);
  
  if (collision_point(x, bbox_bottom, obj_slope, true, true)) {
    y -= 1;
    onSlope = true;
    break;
  } else if (place_meeting(x, y, obj_wall)) {
    y -= sign(velocity[1]);
    break;
  }
}