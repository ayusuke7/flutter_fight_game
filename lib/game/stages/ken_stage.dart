import 'dart:ui';

import 'package:flutter_flight_game/game/camera.dart';
import 'package:flutter_flight_game/game/constants/sprite_data.dart';
import 'package:flutter_flight_game/game/stages/stage.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';
import 'package:flutter_flight_game/game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/game/utils/assets.dart';

class KenStage extends Stage {
  final bg = SpritesData.kenStage(SpriteKey.KEN_BG)[0];
  final boat = SpritesData.kenStage(SpriteKey.KEN_BOAT)[0];
  final floor = SpritesData.kenStage(SpriteKey.KEN_FLOOR)[0];

  KenStage()
      : super(
          spriteSheetData: SpriteSheetData(
            spriteSheet: AssetsUtil.kenStageSpriteSheet,
            animations: {},
          ),
        );

  @override
  void draw(Canvas canvas, Camera camera) {
    /* OCEAN */
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      bg.toRect(),
      bg.toDest((16 - (camera.position.x / 2.15).floorToDouble()), -camera.position.y),
      Paint(),
    );

    /* BOAT */
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      boat.toRect(),
      boat.toDest((150 - (camera.position.x / 1.61).floorToDouble()), -1 - camera.position.y),
      Paint(),
    );

    /* FLOOR */
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      floor.toRect(),
      floor.toDest((192 - camera.position.x).floorToDouble(), 176 - camera.position.y),
      Paint(),
    );
  }

  @override
  void update(FrameTime time, Size size) {}
}
