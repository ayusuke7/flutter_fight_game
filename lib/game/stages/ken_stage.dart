import 'dart:ui';

import 'package:flutter_flight_game/game/stages/stage.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';
import 'package:flutter_flight_game/game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/game/utils/assets.dart';

class KenStage extends Stage {
  KenStage()
      : super(
          spriteSheetData: SpriteSheetData(
            spriteSheet: AssetsUtil.kenStageSpriteSheet,
            animations: {},
          ),
        );

  @override
  void draw(Canvas canvas) {
    /* OCEAN */
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      const Rect.fromLTWH(72, 208, 768, 176),
      const Rect.fromLTWH(-190, -10, 768, 176),
      Paint(),
    );

    /* BOAT */
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      const Rect.fromLTWH(8, 16, 522, 180),
      const Rect.fromLTWH(-128, -10, 522, 180),
      Paint(),
    );

    /* FLOOR */
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      const Rect.fromLTWH(8, 392, 896, 72),
      const Rect.fromLTWH(-256, 168, 896, 72),
      Paint(),
    );
  }

  @override
  void update(FrameTime time, Size size) {}
}
