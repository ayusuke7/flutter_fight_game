import 'dart:ui';

import 'package:flutter_flight_game/game/types/vector.dart';

abstract class GameData {
  static const GAME_VIEWPORT = Size(384, 224);
  static const GAME_SCALE = 2.0;

  static const STAGE_FLOOR = 216.0;
  static const STAGE_WIDTH = 768.0;
  static const STAGE_HEIGHT = 256.0;
  static const STAGE_PADDING = 256.0;
  static const SCROLL_BOUNDRY = 100.0;
  static const STAGE_MID_POINT = STAGE_WIDTH / 2;

  static const FIGHTER_START_DISTANCE = 88.0;

  static final FIGHTER_POSITION_LEFT = Vector(
    STAGE_MID_POINT + STAGE_PADDING - FIGHTER_START_DISTANCE,
    STAGE_FLOOR,
  );

  static final FIGHTER_POSITION_RIGHT = Vector(
    STAGE_MID_POINT + STAGE_PADDING + FIGHTER_START_DISTANCE,
    STAGE_FLOOR,
  );

  static final CAMERA_START_POSITION = Vector(
    STAGE_MID_POINT + STAGE_PADDING - (GAME_VIEWPORT.width / 2),
    16,
  );
}
