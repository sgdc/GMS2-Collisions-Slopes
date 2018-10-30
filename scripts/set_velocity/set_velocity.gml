velocity[0] = 0;
if (left) {
  velocity[0] -= move_speed;
}
if (right) {
  velocity[0] += move_speed;
}

velocity[1] = 0;
if (up) {
  velocity[1] -= move_speed;
}
if (down) {
  velocity[1] += move_speed;
}