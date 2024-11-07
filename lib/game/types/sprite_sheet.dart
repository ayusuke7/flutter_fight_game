import 'dart:ui' as ui;

import 'package:flutter_flight_game/game/types/vector.dart';

class SpriteSheetData {
  final ui.Image spriteSheet;
  final Map<String, List<Sprite>> animations;

  SpriteSheetData({
    required this.spriteSheet,
    required this.animations,
  });
}

class Sprite {
  final double x;
  final double y;

  final double width;
  final double height;

  final Vector? anchor;
  final HitBox? hitBox;

  double delay;

  Sprite(
    this.x,
    this.y,
    this.width,
    this.height, {
    this.anchor,
    this.delay = 0,
    this.hitBox,
  });
}

class HitBox {
  final double x;
  final double y;

  final double width;
  final double height;

  HitBox(this.x, this.y, this.width, this.height);
}
