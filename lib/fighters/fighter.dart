import 'dart:ui' as ui;

import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/sprite.dart';
import 'package:flutter_flight_game/types/vector.dart';

class Fighter {
  final ui.Image spriteSheet;
  final Vector position;
  final Vector velocity;

  final List<Sprite> sprites;

  int animationTimer = 0;
  int animationFrame = 0;

  Fighter({
    required this.spriteSheet,
    required this.position,
    required this.velocity,
    this.sprites = const [],
  });

  Sprite get currentAnimationFrame {
    return sprites[animationFrame];
  }

  void update(FrameTime time) {
    if (time.previous > animationTimer) {
      animationTimer = time.previous;
      animationFrame++;

      if (animationFrame >= sprites.length) {
        animationFrame = 0;
      }
    }
  }

  void draw(ui.Canvas canvas, ui.Size size) {
    canvas.drawImageRect(
      spriteSheet,
      ui.Rect.fromLTWH(
        currentAnimationFrame.x,
        currentAnimationFrame.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      ui.Rect.fromLTWH(
        position.x,
        position.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      ui.Paint(),
    );
  }
}
