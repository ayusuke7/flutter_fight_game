import 'dart:math';
import 'dart:ui';

import 'package:flutter_flight_game/game/constants/game_data.dart';
import 'package:flutter_flight_game/game/fighters/fighter.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';
import 'package:flutter_flight_game/game/types/vector.dart';

class Camera {
  Vector position = Vector(448, 16);
  double speed = 60.0;

  late Fighter player1;
  late Fighter player2;

  Camera(this.player1, this.player2);

  void update(FrameTime time, Size size) {
    // position.x += speed * time.secondsPassed;

    // if (position.x > 640 || position.x < 246) {
    //   speed = -speed;
    // }

    position.y = -6 + (min(player2.position.y, player1.position.y) / 10).floorToDouble();

    var minX = min(player2.position.x, player1.position.x);
    var maxX = max(player2.position.x, player1.position.x);

    if (maxX - minX > size.width - GameData.SCROLL_BOUNDRY * 2) {
      var midPoint = (maxX - minX) / 2;
      position.x = minX + midPoint - (size.width / 2);
    } else {
      for (var fighter in [player1, player2]) {
        if (fighter.position.x < position.x + GameData.SCROLL_BOUNDRY &&
                fighter.velocity.x * fighter.direction.side < 0 ||
            fighter.position.x > position.x + size.width - GameData.SCROLL_BOUNDRY &&
                fighter.velocity.x * fighter.direction.side > 0) {
          position.x += fighter.velocity.x * fighter.direction.side * time.secondsPassed;
        }
      }
    }

    if (position.x < GameData.STAGE_PADDING) {
      position.x = GameData.STAGE_PADDING;
    }
    if (position.x > GameData.STAGE_WIDTH + GameData.STAGE_PADDING - size.width) {
      position.x = GameData.STAGE_WIDTH + GameData.STAGE_PADDING - size.width;
    }
    if (position.y < 0) {
      position.y = 0;
    }
    if (position.y > GameData.STAGE_HEIGHT - size.height) {
      position.y = GameData.STAGE_HEIGHT - size.height;
    }
  }
}
