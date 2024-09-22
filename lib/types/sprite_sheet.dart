import 'package:flutter_flight_game/types/vector.dart';

class Sprite {
  final double x;
  final double y;

  final double width;
  final double height;

  final Vector? anchor;

  Sprite(
    this.x,
    this.y,
    this.width,
    this.height, {
    this.anchor,
  });
}
