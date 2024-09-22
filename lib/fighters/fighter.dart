import 'dart:ui';

import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/types/vector.dart';

class Fighter {
  final Image spriteSheet;
  final Vector position;
  final Vector velocity;

  final List<Sprite> sprites;

  int animationFrame = 0;
  int animationTimer = 0;

  Fighter({
    required this.spriteSheet,
    required this.position,
    required this.velocity,
    required this.sprites,
  });

  Sprite get currentAnimationFrame {
    return sprites[animationFrame];
  }

  void update(FrameTime time) {
    if (time.previous > animationTimer + 60) {
      animationTimer = time.previous;
      animationFrame++;

      if (animationFrame >= sprites.length) {
        animationFrame = 0;
      }
    }
  }

  void draw(Canvas canvas, Size size) {
    canvas.drawImageRect(
      spriteSheet,
      Rect.fromLTWH(
        currentAnimationFrame.x,
        currentAnimationFrame.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      Rect.fromLTWH(
        position.x - currentAnimationFrame.anchor!.x,
        position.y - currentAnimationFrame.anchor!.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      Paint(),
    );
  }
}
