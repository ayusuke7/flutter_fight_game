import 'dart:ui';

import 'package:flutter_flight_game/utils/assets.dart';

class KenStage {
  void draw(Canvas canvas) {
    /* OCEAN */
    canvas.drawImageRect(
      AssetsUtil.kenStageSpriteSheet,
      const Rect.fromLTWH(72, 208, 768, 176),
      const Rect.fromLTWH(-190, -10, 768, 176),
      Paint(),
    );

    /* BOAT */
    canvas.drawImageRect(
      AssetsUtil.kenStageSpriteSheet,
      const Rect.fromLTWH(8, 16, 522, 180),
      const Rect.fromLTWH(-128, -10, 522, 180),
      Paint(),
    );

    /* FLOOR */
    canvas.drawImageRect(
      AssetsUtil.kenStageSpriteSheet,
      const Rect.fromLTWH(8, 392, 896, 72),
      const Rect.fromLTWH(-256, 168, 896, 72),
      Paint(),
    );
  }
}
