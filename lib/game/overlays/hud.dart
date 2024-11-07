import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_flight_game/game/constants/sprite_data.dart';
import 'package:flutter_flight_game/game/fighters/fighter.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';
import 'package:flutter_flight_game/game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/game/types/vector.dart';
import 'package:flutter_flight_game/game/utils/assets.dart';

class Hud {
  int _time = 99;
  int _timeTimer = 0;

  late Fighter _player1;
  late Fighter _player2;

  void update(
    FrameTime time, {
    required Fighter player1,
    required Fighter player2,
  }) {
    _updateTime(time);
    _player1 = player1;
    _player2 = player2;
  }

  void draw(Canvas canvas) {
    _drawStatusBar(canvas);
    _drawTime(canvas);
    _drawTagNames(canvas);
    _drawScore(canvas);
  }

  void _updateTime(FrameTime frameTime) {
    const DELAY = 664;
    if (frameTime.previous > _timeTimer + DELAY) {
      if (_time > 0) _time -= 1;
      _timeTimer = frameTime.previous;
    }
  }

  void _drawStatusBar(Canvas canvas) {
    final healthBar = SpritesData.hudStage(SpriteKey.HEALTH_BAR)[0];
    final koWhite = SpritesData.hudStage(SpriteKey.KO_WHITE)[0];

    _drawFrame(canvas, healthBar, Vector(31, 20), 1);
    _drawFrame(canvas, koWhite, Vector(176, 19), 1);
    _drawFrame(canvas, healthBar, Vector(353, 20), -1);
  }

  void _drawTagNames(Canvas canvas) {
    final keys = SpriteKey.values.asNameMap();

    final keyPlayer1 = keys["tag_${_player1.name}".toUpperCase()];
    final tagPlayer1 = SpritesData.hudStage(keyPlayer1!)[0];
    _drawFrame(canvas, tagPlayer1, Vector(32, 33), 1);

    final keyPlayer2 = keys["tag_${_player2.name}".toUpperCase()];
    final tagPlayer2 = SpritesData.hudStage(keyPlayer2!)[0];
    _drawFrame(canvas, tagPlayer2, Vector(322, 33), 1);
  }

  void _drawScore(Canvas canvas) {
    final scoreNumber = SpritesData.hudStage(SpriteKey.SCORE_NUMBER);
    final scoreLetter = SpritesData.hudStage(SpriteKey.SCORE_LETTER);

    // Draw 1P
    _drawFrame(canvas, scoreNumber[1], Vector(4, 1), 1);
    _drawFrame(canvas, scoreLetter[0], Vector(17, 1), 1);
    _drawFrame(canvas, scoreNumber[1], Vector(130, 1), 1);

    // Draw 2P
    _drawFrame(canvas, scoreNumber[2], Vector(269, 1), 1);
    _drawFrame(canvas, scoreLetter[0], Vector(281, 1), 1);
    _drawFrame(canvas, scoreNumber[1], Vector(360, 1), 1);
  }

  void _drawTime(Canvas canvas) {
    final timeNums = SpritesData.hudStage(SpriteKey.TIME);
    final [n1, n2] = "$_time".padLeft(2, "0").split("");

    _drawFrame(canvas, timeNums[int.parse(n1)], Vector(178, 35), 1);
    _drawFrame(canvas, timeNums[int.parse(n2)], Vector(194, 35), 1);
  }

  void _drawFrame(
    Canvas canvas,
    Sprite sprite,
    Vector position,
    double direction,
  ) {
    canvas.save();
    canvas.scale(direction, 1);
    canvas.drawImageRect(
      AssetsUtil.hudStageSpriteSheet,
      sprite.toRect(),
      sprite.toDest(position.x * direction, position.y),
      Paint(),
    );
    canvas.transform(Matrix4.identity().storage);
    canvas.restore();
  }
}
