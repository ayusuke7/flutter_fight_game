import 'package:flutter/material.dart';
import 'package:flutter_flight_game/game/camera.dart';
import 'package:flutter_flight_game/game/fighters/fighter.dart';
import 'package:flutter_flight_game/game/overlays/hud.dart';
import 'package:flutter_flight_game/game/stages/stage.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';

class GameBoard extends CustomPainter {
  final FrameTime frameTime;

  final Fighter player1;
  final Fighter player2;

  final Camera camera;
  final Stage stage;
  final Hud hud;

  GameBoard({
    required this.frameTime,
    required this.player1,
    required this.player2,
    required this.stage,
    required this.camera,
    required this.hud,
  });

  @override
  void paint(Canvas canvas, Size size) {
    camera.update(frameTime, size);

    stage.update(frameTime, size);
    stage.draw(canvas, camera);

    player1.update(frameTime, size, camera);
    player1.draw(canvas, camera);

    player2.update(frameTime, size, camera);
    player2.draw(canvas, camera);

    hud.update(
      frameTime,
      player1: player1,
      player2: player2,
    );
    hud.draw(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
