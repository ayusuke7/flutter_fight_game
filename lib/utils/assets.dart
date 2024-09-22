import 'dart:ui' as ui;

import 'package:flutter/services.dart';

abstract class AssetsUtil {
  static late ui.Image ryuSpriteSheet;

  static Future<void> loadAllImages() async {
    ryuSpriteSheet = await _loadImage("assets/images/ryu.png");
  }

  static Future<ui.Image> _loadImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    final frame = await codec.getNextFrame();
    return frame.image;
  }
}
